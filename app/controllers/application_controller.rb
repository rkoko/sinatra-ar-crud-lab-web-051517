require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.new(name: params[:name], content: params[:content])
    @post.save
    erb :index
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # post_id = params[:id].to_i
    # if Post.pluck(:id).include?(post_id)
      @post = Post.find(params[:id])
      erb :show
    # else
    #   erb :'404'
    # end
  end

  get '/posts/:id/edit' do
    # post_id = params[:id].to_i
    # if Post.pluck(:id).include?(post_id)
      @post = Post.find(params[:id])
    erb :edit
  # else
  #   erb :'404'
  # end
  end

  patch '/posts/:id' do
    Post.update(params[:id], name: params[:name], content: params[:content])
    @posts = Post.all
    erb :index
  end

  delete '/posts/:id/delete' do
    @post=Post.find(params[:id])
    Post.destroy(params[:id])
    erb :delete
  end
end
