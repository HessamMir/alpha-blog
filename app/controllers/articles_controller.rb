class ArticlesController < ApplicationController
   #here i have used refactoring through these and added set:article for all the methods listed below
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def show
    
  end
 #i declare the pagination and give it rules so that it doesnt exceed 5 per page
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
    
    
  end
 #this instance variable is made to make a new article each time 
  def new
    @article = Article.new
  end

  def edit
    

  end
 #this create function is for the buttons which have been submitted
  #it makes an instance variable and the article params makes it a specific user_id
  def create
    @article = Article.new(article_params)
     #this allows the current user logged in to have this article in their name
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created succesfully."
      redirect_to article_path(@article)
    else 
      render 'new'
    

    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to article_path(@article)
    else
      render 'edit'

    end
  end

  def destroy   
    @article.destroy
    redirect_to articles_path
  end

  private
   #these are my refactored bits of code
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description, category_ids: [])

  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "you can edit or delete your own articles only"
      redirect_to @article
    end
    
  end


end