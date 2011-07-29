module Comatose
# Page attributes
#  - parent_id
#  - title
#  - full_path
#  - slug
#  - keywords
#  - layout
#  - body
#  - author
#  - filter_type
#  - position
#  - version
#  - updated_at
#  - created_at
  class Page < ActiveRecord::Base

    set_table_name 'comatose_pages'

    attr_accessor :new_root_page

    # Only versions the content... Not all of the meta data or position
    acts_as_versioned :table_name=>'comatose_page_versions', :if_changed => [:title, :slug, :keywords, :body]

    define_option :active_mount_info, {:root=>'', :index=>''}

    acts_as_tree :order => "position, title"
    acts_as_list :scope => :parent_id

    #before_create :create_full_path
    before_save :cache_full_path, :create_full_path
    after_save :update_children_full_path

    # Using before_validation so we can default the slug from the title
    before_validation do |record|
      # Create slug from title
      if record.slug.blank? and !record.title.blank?
        record.slug = record.title.downcase.lstrip.rstrip.gsub( /[^-a-z0-9~\s\.:;+=_]/, '').gsub(/[\s\.:;=_+]+/, '-').gsub(/[\-]{2,}/, '-').to_s
      end
    end


    validates_presence_of   :title,     :on => :save,                         :message => "must be present"
    validates_uniqueness_of :slug,      :on => :save,   :scope=>'parent_id',  :message => "is already in use"

    validates :parent_id, :presence => true, :on => :create, :unless => :new_root_page


    # Tests ERB/Liquid content...
    validates_each :body, :allow_nil=>true, :allow_blank=>true do |record, attr, value|
      begin
        body_html = record.to_html
      rescue SyntaxError => e
        Comatose.logger.debug e.message
        record.errors.add :body, "syntax error: #{$!.to_s.gsub('<', '&lt;')}"
      rescue => e
        Comatose.logger.debug e.message
        record.errors.add :body, "content error: #{$!.to_s.gsub('<', '&lt;')}"
      end
    end


    class <<self

      def create_root(attrs)
        Page.create(attrs)
      end


      def method_added(what)
        Comatose.logger.debug "method added: #{what.to_s}"
      end

    end


    # Returns a pages URI dynamically, based on the active mount point
    def uri
      if full_path == ''
        active_mount_info[:root]
      else
        page_path = (full_path || '').split('/')
        idx_path = active_mount_info[:index].split('/')
        uri_root = active_mount_info[:root].split('/')
        uri_path = ( uri_root + (page_path - idx_path) ).flatten.delete_if {|i| i == "" }
        ['',uri_path].join('/')
      end
    end

    # Check if a page has a selected keyword... NOT case sensitive.
    # So the keyword McCray is the same as mccray
    def has_keyword?(keyword)
       @key_list ||= (self.keywords || '').downcase.split(',').map {|k| k.strip }
       @key_list.include? keyword.to_s.downcase
     rescue
       false
     end

    # Returns the page's content, transformed and filtered...
    def to_html(options={})
      #version = options.delete(:version)
      text              = self.body
      binding           = Comatose::ProcessingContext.new(self, options)
      filter_type       = self.filter_type || '[No Filter]'
      transformed_text  = TextFilters.transform(text, binding, filter_type, Comatose.config.default_processor)
      #Comatose.logger.debug "transformed_text: #{transformed_text}"
      return transformed_text
    end
    alias :to_comatose_html :to_html


    # Returns a Page with a matching path.
    def self.find_by_path(path)
      Comatose.logger.debug "looking for Page with path: #{path}"
      if path.blank?
        Comatose.logger.debug "could not find Page with path: #{path}"
      else
       path = path.split('.')[0] # Will ignore file extension...
       if path.length > 1
         path = path[1..-1] if path.starts_with? "/"
       end
      end
      find( :first, :conditions=>[ 'full_path = ?', path ] )
    end


  protected

    # Creates a URI path based on the Page tree
    def create_full_path
       if parent_node = self.parent
          # Build URI Path
          path = "#{parent_node.full_path}/#{self.slug}"
          # strip leading space, if there is one...
          path = path[1..-1] if path.starts_with? "/"
          self.full_path = path || ""
       else
          # I'm the root -- My path is blank
          self.full_path = ""
       end
    end


    def create_full_path!
      create_full_path
      save
    end


    # Caches old path (before save) for comparison later
    def cache_full_path
      @old_full_path = self.full_path
    end


    # Updates all this content's child URI paths
    def update_children_full_path(should_save=true)
      # OPTIMIZE: Only update all the children if the :slug/:fullpath is different
      for child in self.children
        child.create_full_path! unless child.frozen?
        child.update_children_full_path(should_save)
      end
    end
  end
end

