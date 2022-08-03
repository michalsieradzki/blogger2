class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])

    @comment = Comment.new
    @comment.article_id = @article.id
    
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(strong_article_params)
  
    flash.notice = "Artykuł #{@article.title} został utworzony"
    
    redirect_to article_path(@article)
  end

  def destroy
    
    @article = Article.find(params[:id])
    Tagging.where(article_id: @article.id).destroy_all

    @article.destroy

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

private

  def strong_article_params
    params.require(:article).permit(:title, :body, :tag_list, :cover_image)
  end

end
