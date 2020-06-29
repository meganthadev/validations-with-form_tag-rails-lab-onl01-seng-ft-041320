class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]
  
  def create
    @post = Post.new(post_params)
      if @post.valid?
       @post.save
       redirect_to post_path(@post)
      else 
        render :new
    end
  end 
  
  def index 
    @authors = Author.all 
  end 
  
  def show
  end

  def edit
  end

  def update
    @article = Post.find(params[:id])
      if @article.valid?
       @article.save
       redirect_to post_path(@article)
      else 
        render :edit
    end
  end 


  private

  def post_params
    params.permit(:title, :category, :content)
  end
  
  def set_post!
    @post = Post.find(params[:id])
  end
  
end
