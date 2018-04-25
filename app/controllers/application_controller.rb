
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  #CREATE
  post "/posts" do
    Post.create(name: params[:name], content: params[:content])
    @posts = Post.all

    erb :index
  end

  #READ
  get "/posts" do
    @posts = Post.all

    erb :index
  end

  #READ
  get "/posts/:id" do
    @post = Post.find_by(id: params[:id].to_i)

    erb :show
  end

  #UPDATE
  get "/posts/:id/edit" do
    @post = Post.find_by(id: params[:id].to_i)

    erb :edit
  end

  #UPDATE
  patch "/posts/:id" do
    @post = Post.find_by(id: params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save

    erb :show
  end

  #DELETE
  delete '/posts/:id/delete' do #delete action
    @post = Post.find_by_id(params[:id].to_i)
    @post.delete

    erb :delete
  end

end
