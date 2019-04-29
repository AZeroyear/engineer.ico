require 'sinatra/namespace'
require_relative 'excel_helper'

before do
  @heading = [
    ["class", "1. 始めようクラスモジュール", make_directory_tag('./views/excel/class*')],
    ["act", "2. 自作クラスモジュールの応用編", make_directory_tag('./views/excel/act*')],
    ["vba","3. VBAコード集", make_directory_tag('./views/excel/vba*')]
  ]

  @excel_class = make_directory_tag('./views/excel/class*')
  @act_class   = make_directory_tag('./views/excel/act*')
  @vba_class   = make_directory_tag('./views/excel/vba*')
end

get '/' do
  erb :'excel/index', :layout => :'excel/layout'
end

get '/about' do
  erb :'about', :layout => :'excel/layout'
end

get '/:number' do
  @back_next = back_next(params['number'])
  sort_method(params['number'])
  erb :"excel/#{params['number']}", :layout => :'excel/layout'
end
