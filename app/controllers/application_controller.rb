
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  post '/posts' do
    post = Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])

    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.update(params[:id], name: params[:name], content: params[:content])

    erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.delete(params[:id])

    erb :delete
  end

end
