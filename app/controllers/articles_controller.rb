class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update]
  
  def new
  	@article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = 2
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

  def update
    if @article.update(article_params)
      p "article succesfully updated"
      redirect_to @article
    else
      render "edit"
    end
  end

  def show
  	
  end

  def index
  	@articles = Article.all.order('CREATED_AT DESC')
  end

  def search

  end

  def results
    @results = params[:q]
    p params[:date_submitted]

    if params[:terms].to_i != 1
      p 'user did not agree'
      render 'search'
    end

    p params

    search_words = params[:q].split(' ')
    titles = Article.pluck(:title)
    matches= []
    @final_results = []
    search_words.each do |word|
      titles.each do |t|
        if t.include?(word)
          matches << t
        end
      end
    end
    p matches
    matches.each do |match|
      Article.all.each do |article|
        x = Article.where(title: match)
        x.each do |y|
          @final_results << y
        end
      end
    end
    @final_results.uniq!
  end

  private

  def article_params
  	params.require(:article).permit(:title, :author, :content, :cover_photo)
  end

  def find_article
  	@article = Article.find(params[:id])
  end

end





