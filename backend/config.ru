require 'rack/cors'
require './app/application.rb'
require_relative "./config/environment.rb"

use Rack::Cors do

    allow do
        origins '*'
        resource '/*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options]  
    end
end


run Application.new
