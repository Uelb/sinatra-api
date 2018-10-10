require 'bundler/setup'
require 'sinatra/base'
require_relative './json_handler'

class Api < Sinatra::Base

	get '/hello' do
		'Hello world!'
	end

  before do
    content_type 'application/json'
  end

  def self.index index_name
    get "/#{index_name}" do
      JSONHandler.new(index_name).read_collection
    end
  end

  def self.show show_name
    get "/#{show_name}/:id" do
      json_elem = JSONHandler.new(show_name).read_element params[:id]
      json_elem || status(404)
    end

  end

  def self.resource resource_name
    index resource_name
    show resource_name
  end


  resource 'directors'
  resource 'movies'

end
