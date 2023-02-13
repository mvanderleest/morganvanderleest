require 'sinatra'

get '/' do
  erb :index
end

get '/:article' do
  if File.exist?("views/#{params['article']}.erb")
    erb params['article'].to_sym
  else
    four_oh_four
  end
end

get '*' do
  four_oh_four
end

private
def four_oh_four
  erb :four_oh_four
end
