require 'sinatra'
require 'rdiscount'

get '/' do
  erb :index
end

get '/:article' do
  render_file(params['article'])
end

get '*' do
  four_oh_four
end

private
def four_oh_four
  erb :four_oh_four
end

def render_file(file_name)
  if File.exist?("views/#{file_name}.erb")
    erb params['article'].to_sym
  elsif File.exist?("views/#{file_name}.md")
    # markdown = RDiscount.new("Hello World!")
    markdown params['article'].to_sym, :layout_engine => :erb
  else
    four_oh_four
  end
end
