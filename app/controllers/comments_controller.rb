class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(strong_comment_params)
    @comment.article_id = params[:article_id]

    @comment.save
    
    redirect_to article_path(@comment.article)
  end


  private
    def strong_comment_params
      params.require(:comment).permit(:author_name, :body)
    end
end
