class WelcomeController < ApplicationController
  include JSONAPI::ActsAsResourceController
  def index
    render json: { status: 'SUCCESS', message: 'Welcome my friend' }
  end
end
