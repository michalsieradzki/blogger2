class CommentsController < ApplicationController
  before_action ::authenticate_user!, only: [:create]

  def create
    @comment = Comment.new(strong_comment_params.merge(user_id: current_user.id))
    @comment.article_id = params[:article_id]

    @comment.save
    
    redirect_to article_path(@comment.article)
  end


  private
    def strong_comment_params
      params.require(:comment).permit(:body)
    end
end
