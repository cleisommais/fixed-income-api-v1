class WelcomeController < ApplicationController
    def index
      render json: { status: 'SUCCESS', message: 'Welcome my friend' }
    end
end
