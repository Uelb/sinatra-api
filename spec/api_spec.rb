require 'spec_helper'
require 'rack/test'
require_relative '../app/api'

RSpec.describe Api do
 include Rack::Test::Methods

  def app
    Api.new
  end

  it 'says hello' do
    get '/hello'
    expect(last_response.body).to eq 'Hello world!'
  end

  it 'returns the list of movies' do
    get '/movies'
    expect(last_response.body).to include 'The Gold Rush'
  end

  it 'returns a specific movie' do
    get '/movies/3'
    expect(last_response.body).to include 'The General'
  end

  # Your turn to write the next spec!
  it 'returns the list of directors' do
    get '/directors'
    expect(last_response.body).to include 'Alfred Hitchcock'
  end

  it 'returns a specific director' do
    get '/directors/3'
    expect(last_response.body).to include 'Buster Keaton'
  end

  it 'returns 404 when no element found' do
    get '/directors/4'
    expect(last_response.status).to eq 404
  end
end
