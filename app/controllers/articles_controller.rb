class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(strong_article_params)
    @article.save
    
    flash.notice = "Artykuł #{@article.title} został utworzony"
    
    redirect_to article_path(@article)
  end

  def delete
    @article = Article.find(params[:id])
    @article.delete

    flash.notice = "Artykuł #{@article.title} został usunięty"

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(strong_article_params)

    flash.notice = "Artykuł #{@article.title} został zaktualizowany"

    redirect_to article_path(@article)
  end



  def strong_article_params
    params.require(:article).permit(:title, :body)
  end

end
