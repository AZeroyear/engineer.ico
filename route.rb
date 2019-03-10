require 'sinatra'
require 'sinatra/reloader'
require_relative 'engineer_calculator/engineer_calculator.rb'

before do
  @eng_calc = Engineer::Calculator.new
  @result = @eng_calc.calc(params["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
end

get '/' do
  erb :index
end

get '/calculator' do
  @title = "ENGINEER.ico / Calculator"
  erb :calculator
end

post '/calculator' do
  @title = "Engineer.Calculator"
  @result = @eng_calc.calc(params["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
  erb :calculator
end

get '/test' do
  erb :miliglamtest
end

get '/miltest' do
  erb :index_test
end

get '/index_test' do
  erb "index_test.html"
end
