require 'sinatra'
require 'sinatra/subdomain'
require 'sinatra/reloader'

subdomain :eng do
  require './controller/engineer.rb'
end

subdomain :excel do
  require './controller/excel.rb'
end

run Sinatra::Application
