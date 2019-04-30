require 'sinatra'
require 'sinatra/subdomain'
require 'sinatra/reloader'

subdomain :eng do
  require './controller/engineer.rb'
end

subdomain :excel do
  require './controller/excel.rb'
end

get '/' do
  'please access to <a href="eng.eastazy.work">ENGINEER.ico</a> & <a href="eng.eastazy.work">EXCEL.ico</a>'
end

run Sinatra::Application
