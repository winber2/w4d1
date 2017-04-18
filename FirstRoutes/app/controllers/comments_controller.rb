class CommentsController < ApplicationController

  def index
    if user_id = comment_params[:user_id]
      user = User.find(user_id)
      render json: user.comments
    elsif artwork_id = comment_params[:artwork_id]
      artwork = Artwork.find(artwork_id)
      render json: artwork.comments
    else
      render text: "comments not found for user/artwork", status: :not_found
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  rescue
    if commment
      render json: comment.errors.full_messages, status: :unprocessable_entity
    else
      render text: "comment not found", status: :not_found
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
