module Comatose
  class ApplicationController < ActionController::Base

    before_filter :set_locale


    def comatose_current_user
      @_current_user
    end


    def set_locale
      locale_language, locale_country = params[:locale].to_s.split('-')
      locale_language ||= 'en'
      locale_country  ||= 'US'
      locale_language.downcase.to_sym
      locale_country.upcase!
      I18n.locale = locale_language
      logger.debug "Locale set to #{locale_language} from param #{params[:locale]}"
    end


    def find_page(*args)
      Comatose::Page.send(Comatose.config.page_finder, *args)
    end



  end
end