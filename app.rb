require 'sinatra'
require 'rdiscount'

get '/' do
  erb :index
end

get '/:article' do
  render_file(params['article'])
end

get '/articles' do
  erb :articles
end

get '*' do
  four_oh_four
end

private
def four_oh_four
  erb :four_oh_four
end

def render_file(file_name)
  sub_directory = ""
  if File.file?("views/articles/#{file_name}.erb") or File.file?("views/articles/#{file_name}.md")
    sub_directory = "articles/"
  end
  if File.file?("views/#{sub_directory}#{file_name}.erb")
    erb "#{sub_directory}#{params['article']}".to_sym
  elsif File.file?("views/#{sub_directory}#{file_name}.md")
    markdown "#{sub_directory}#{params['article']}".to_sym, :layout_engine => :erb
  else
    four_oh_four
  end
end
