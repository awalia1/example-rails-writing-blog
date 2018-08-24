class ArticlesController < ApplicationController
	before_action :find_article, only: [:show, :edit]
  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		p "article saved!"
  		redirect_to @article
  	else
  		p "Article rejected for errors"
  		p @article.errors.messages
  		render "new"
  end
end

  def edit

  end

  def show
  	
  end

  def index
  	@articles = Article.all.order('CREATED_AT DESC')
  end

  private

  def article_params
  	params.require(:article).permit(:title, :author, :content)
  end

  def find_article
  	@article = Article.find(params[:id])
  end

end





