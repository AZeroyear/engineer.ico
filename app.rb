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

post '/' do
  @result = @eng_calc.calc(params["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
  erb :index
end
