require 'sinatra'

get '/' do
  erb :index
end

get '/:article' do
  if File.exist?("views/#{params['article']}.erb")
    erb params['article'].to_sym
  else
    erb :index
  end
end
