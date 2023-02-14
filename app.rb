require 'sinatra'

get '/' do
  erb :index
end

get '/:article' do
  if path_matches_file_name(params['article'])
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

def path_matches_file_name(path)
  File.exist?("views/#{path}.erb")
end
