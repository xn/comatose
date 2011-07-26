# This is the rendering context object you have access to in text processing...
module Comatose
  class ProcessingContext < Hash
    @@supported_methods = %w(page include)

    attr_accessor :locals, :page

    def initialize(page, params={})
      @locals = params.stringify_keys rescue params
      @page   = Comatose::PageWrapper.new(page, locals)
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
        page = Page.find_by_path(path)
        Comatose::PageWrapper.new(page, self[:locals])
      rescue
        "<p>Page at <tt>#{path}</tt> could not be found.</p>"
      end
    end


    def [](key)
      #Comatose.logger.debug "[] called with key: #{key}"
      #Comatose.logger.debug "locals: #{locals.to_s}"
      if key.to_s.downcase == 'page'
        @page
      elsif locals.has_key? key
        locals[key]
      elsif Comatose.registered_drops.has_key? key
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



