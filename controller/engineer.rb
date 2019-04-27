require 'json'
if Dir.exist?('../../engineer_calculator')
  require_relative '../../engineer_calculator/lib/engineer_calculator.rb'
else
  require 'engineer_calculator'
end

before do
  @eng_calc = Engineer::Calculator.new
  @result = @eng_calc.calc(params["calc"])
  @alter = @eng_calc.alter
  @error = @eng_calc.error
end

get '/' do
  erb :'engineer/index', :layout => :'engineer/layout'
end

get '/calculator' do
  erb :'engineer/calculator', :layout => :'engineer/layout'
end

post '/calculator' do
  erb :'engineer/calculator', :layout => :'engineer/layout'
end

post '/js_post' do
  erb :'engineer/_result', :layout => false
end
