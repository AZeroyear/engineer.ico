require 'sinatra'
require 'json'
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

get '/unit_test' do
  @result = @eng_calc.calc("100kg")
  @alter = @eng_calc.alter
  @error = @eng_calc.error
  erb :_result, :layout => false
end

get '/calculator' do
  @title = "ENGINEER.ico / Calculator"
  erb :calculator
end

post '/calculator' do
  @result = @eng_calc.calc(params["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
  erb :calculator
end

post '/js_post' do
  q = Hash[params]
  @result = @eng_calc.calc(q["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
  erb :_result, :layout => false
end
