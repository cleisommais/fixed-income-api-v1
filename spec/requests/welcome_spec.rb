require 'rails_helper'

describe 'Welcomes', type: :request do
  scenario 'GET /api/v1/welcome' do
    get '/api/v1/welcome'
    expect(response).to have_http_status(:ok)
    expect(response).to be_successful
    expect(response.body).to include('message')
    expect(response.body).to include('status')
  end
  scenario 'GET /' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response).to be_successful
    expect(response.body).to include('message')
    expect(response.body).to include('status')
  end
end
