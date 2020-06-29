class AuthorsController < ApplicationController
  before_action :set_author!, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
      if @author.valid?
       @author.save
       redirect_to author_path(@author)
      else 
        render :new
    end
  end  
  
  def index 
    @authors = Author.all 
  end 
  
  def update
    @author = Author.find(params[:id])
      if @author.valid?
       @author.save
       redirect_to author_path(@author)
      else 
        render :edit
      end   
  end
    
  def edit 
  end   

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
  
  def set_author!
    @author = Author.find(params[:id])
  end
  
end
