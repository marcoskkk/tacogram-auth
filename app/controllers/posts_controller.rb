class PostsController < ApplicationController

    def index
      @posts = Post.all
    end
  
    def new
      @post = Post.new
      if @current_user
      else
        flash[:notice] = "Login to post"
        redirect_to "/posts"
      end
    end
  
    def create
      @post = Post.new(params["post"])
      @post.user_id = @current_user.id #set user_id in the database
      @post.save
      redirect_to "/posts"
    end
  
  end