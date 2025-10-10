class ApplicationController < ActionController::Base
    def favorite_text
        return @favorite_exists ? 'Favorited' : 'Favorite'
    end

    helper_method :favorite_text
end
