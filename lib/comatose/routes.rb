module Comatose
  module Routes

    def routes_for_comatose(opts, &block)
      Comatose.logger.debug("routes_for_comatose options: #{opts}")
      case
        when opts.empty?
          scope :module => "comatose" do
            constraints(LocaleConstraint) do
              match '/:locale/:page', :to => 'base#show'
              match '/:locale', :to => 'base#show', :as => 'comatose_root'
            end
          end
        when opts[:mount]
          scope :module => "comatose" do
            constraints(LocaleConstraint) do
              match "/:locale/#{opts[:mount]}/:page", :to => 'base#show', :index => opts[:mount]
              match "/:locale/#{opts[:mount]}", :to => 'base#show', :as => "#{opts[:mount]}_comatose_root"
            end
          end
      end
    end


    def admin_routes_for_comatose(*opts, &block)
      namespace :comatose, :path => "/:locale/comatose" do
        constraints(LocaleConstraint) do
          resources :pages, :controller => 'admin' do
            collection do
              post :import
              get :export, :expire
            end

            member do
              get :preview, :versions
            end
          end
        end
      end
    end


  end
end
