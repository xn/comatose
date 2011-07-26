module Comatose

  class Drop < ::Liquid::Drop

    private :initialize

    def before_method(method)
      self.send(method.to_sym)
    rescue
      Comatose.logger.debug "Error calling #{method}: #{$!}"
      raise $!
    end

    class << self
      # Define a new Comatose::Drop by name
      def define(name, &block)
        d = Comatose::Drop.new
        d.instance_eval(&block)
        Comatose.registered_drops[name] = d
      rescue
        Comatose.logger.debug "Drop '#{name}' was not included: #{$!}"
      end
    end
  end

  class << self

    # Returns/initializes a hash for storing ComatoseDrops
    def registered_drops
      @registered_drops ||= {}
    end

    # Simple wrapper around the ProcessingContext.define method
    # I think Comatose.define_drop is probably simpler to remember too
    def define_drop(name, &block)
      Comatose::Drop.define(name, &block)
    end

    # Registers a 'filter' for Liquid use
    def register_filter(module_name)
      Liquid::Template.register_filter(module_name)
    end

  end
end
