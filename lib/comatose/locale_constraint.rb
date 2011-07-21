module Comatose
  module Routes
    class LocaleConstraint

      class <<self

        def matches(request)
          request.params[:locale] =~ /^[a-z]{2}(-[a-z]{2}){0,1}$/
        end

      end

    end
  end
end