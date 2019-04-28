require 'sinatra/namespace'
require_relative 'excel_helper'

get '/' do
  @excel_class = make_directory_tag('./views/excel/class*')
  @act_class = make_directory_tag('./views/excel/act*')
  @vba_class = make_directory_tag('./views/excel/vba*')
  erb :'excel/index', :layout => :'excel/layout'
end

get '/:number' do
  erb :"excel/#{params['number']}", :layout => :'excel/layout'
end
