require 'support/class_options'
module Comatose
  class TextFilters

    define_option :default_processor, :erb
    define_option :default_filter, :none
    define_option :logger, Comatose.logger

    @registered_filters = { }
    @registered_titles  = { }

    attr_reader :name
    attr_reader :title


    def initialize(name, title)
      @name  = name
      @title = title
    end


      # The default create_link method...
      # Override for your specific filter, if needed, in the #define block
    def create_link(title, url)
      %Q|<a href="#{url}">#{title}</a>|
    end


      # Process the text with using the specified context
    def process_text(text, context, processor=TextFilters.default_processor)
      processed_text = nil
      #Comatose.logger.debug "text before process: #{text}"
      case
      when processor == :erb
        processed_text = process_with_erb(text, context)
      when processor == :liquid
        processed_text = process_with_liquid(text, context)
      else
        raise "Unknown Text Processor '#{processor.to_s}'"
      end
      #Comatose.logger.debug "text after process: #{processed_text}"
      return processed_text
    end


    class << self
      private :new
      attr_reader :registered_filters
      attr_reader :registered_titles

        # Use this to create and register your TextFilters
      def define(name, title, &block)
        begin
          p = new(name, title)
          p.instance_eval(&block)
          if p.respond_to? :render_text
            registered_titles[title] = name
            registered_filters[name] = p
          else
            raise "#render_text isn't implemented in this class"
          end
        rescue LoadError
          #Comatose.logger.debug "Filter '#{name}' was not included: #{$!}" unless TextFilters.logger.nil?
        rescue
          #Comatose.logger.debug "Filter '#{name}' was not included: #{$!}" unless TextFilters.logger.nil?
        end
      end


      def get_filter(name)
        #Comatose.logger.debug "get_filter: #{name}"
        name = TextFilters.default_filter if name.nil?
        name = registered_titles[name] if name.is_a? String
        registered_filters[name]
      end


      def [](name)
        get_filter(name)
      end


      def all
        registered_filters
      end


      def all_titles
        registered_titles.keys
      end


      def render_text(text, name=nil)
        get_filter(name).render_text(text)
      end


      def process_text(text, context=nil, name=nil, processor=nil)
        get_filter(name).process_text(text, context, processor)
      end


        # Call
      def transform(text, context=nil, name=nil, processor=nil)
        #Comatose.logger.debug "transform with text #{text}"
        #Comatose.logger.debug "transform with context #{context}"
        #Comatose.logger.debug "transform with name #{name}"
        #Comatose.logger.debug "transform with processor #{processor}"
        render_text process_text(text, context, name, processor), name
      end
    end

    private

      # This is an instance method so that it won't puke on requiring
      # a non-existant library until it's being registered -- the only
      # place I can really capture the LoadError
    def require(name)
      Kernel.require name
    end



    def process_with_erb(text, context)
      Comatose.logger.debug "process erb before: #{text}"
      output = ERB.new(text).result(context.get_binding)
      Comatose.logger.debug "process erb after: #{output}"
      return output
    rescue => e
      Comatose.logger.debug e.backtrace.join("\n")
      raise "ERB Error: #{$!}"
    end



    def process_with_liquid(text, context={})
      #Comatose.logger.debug "process liquid before: text: #{text}"
      #Comatose.logger.debug "process liquid before: context: #{context}"
      #context = context.stringify_keys if context.respond_to? :stringify_keys
      Liquid::Template.parse(text).render(context)
    rescue => e
      Comatose.logger.debug e.backtrace.join("\n")
      raise "Liquid Error: #{$!}"
    end


  end
end