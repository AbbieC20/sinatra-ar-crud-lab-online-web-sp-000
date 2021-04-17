
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/newarticle' do
    title = params[:title]
    content = params[:content]
    new_article = Article.create(title: title, content: content)
    redirect "/articles/#{new_article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.where("id = ?", params[:id])
    erb :show
  end

end
