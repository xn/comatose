require 'comatose'
require 'rails'

module Comatose

  class Engine < Rails::Engine

    engine_name "comatose"

    initializer 'comatose.add_routes' do |app|
      Rails.logger.debug "Adding Comatose::Routes"
      ActionDispatch::Routing::Mapper.send :include, Comatose::Routes
    end

    class <<self

      def load_tasks
        begin
          require 'comatose/tasks/admin'
          require 'comatose/tasks/setup'
          require 'comatose/tasks/data'
        rescue LoadError
          $: << File.join(File.dirname(__FILE__), '..', 'lib')
        end
      end
    end


  end
end
