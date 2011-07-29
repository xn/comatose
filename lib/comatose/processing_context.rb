# This is the rendering context object you have access to in text processing...
module Comatose
  class ProcessingContext < Hash
    @@supported_methods = %w( page include current_user )

    attr_accessor :locals, :page, :current_user, :system


    def initialize(page, params={})
      params = params.stringify_keys rescue params
      #Comatose.logger.debug("params in ProcessingContext: #{params}")
      @system       = params.delete('system')  || {}
      @current_user = @system['current_user']
      @locals = params
      @page = Comatose::PageWrapper.new(page, @locals, @system)
      #rescue => e
      #  Comatose.logger.debug "ProcessingContext: initialize: #{e.message}"
      #  Comatose.logger.debug e.backtrace.join("\n")
      #  raise e
    end


      #def include(path, locals={})
      #  begin
      #    page = Page.find_by_path(path)
      #    page.to_html(self[:locals].merge(locals) )
      #  rescue
      #    "<p>Page at <tt>#{path}</tt> could not be found.</p>"
      #  end
      #end


    def find_by_path(path)
      begin
        # page = Page.find_by_path(path)
        Page.send(Comatose.config.page_finder, path)
        Comatose::PageWrapper.new(page, self[:locals])
      rescue
        "<p>Page at <tt>#{path}</tt> could not be found.</p>"
      end
    end


    def [](key)
      #Comatose.logger.debug "[] called with key: #{key}"
      #Comatose.logger.debug "current_user: #{current_user.to_s}"
      case
        when key.to_s.downcase == 'page'
          @page
        when key.to_s.downcase == 'current_user'
          @current_user
        when locals.has_key?(key)
          locals[key]
        when Comatose.registered_drops.has_key?(key)
          Comatose.registered_drops[key]
      end
    end


    def has_key?(key)
      @@supported_methods.include?(key) or locals.has_key?(key) or Comatose.registered_drops.has_key?(key)
    end


    def to_liquid
      self
    end


    def get_binding
      binding
    end


    def inspect
      h = self.dup.merge(:page => page, :current_user => current_user, :locals => locals)
    end


    def method_missing(method_id, *args)
      #Comatose.logger.debug("processing_context: method_missing: method: #{method_id}")
      #Comatose.logger.debug("processing_context: method_missing: args: #{args}")
      method_name = method_id.to_s
      case
        when locals.has_key?(method_name)
          locals[method_name]
        when page.respond_to?(method_name)
          page.send(method_name, args)
        when Comatose.registered_drops.has_key?(method_name)
          Comatose.registered_drops[method_name].context = self
          Comatose.registered_drops[method_name].send(args)
        #else Hash.respond_to?(method_id)
        #  super(method_id, args)
        #else
        #  "ProcessingContext: Couldn't find #{method_id}"
      end
    end

  end
end



