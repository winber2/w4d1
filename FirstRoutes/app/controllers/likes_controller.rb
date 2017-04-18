class LikesController < ApplicationController
  def index
    type = params[:likeable_type]
    user_id = params[:user_id]
    id = params[:likeable_id]
    if type == "Artwork" || type == "Comment"
      render json: Like.where("likeable_type = ? AND likeable_id = ?", type, id)
    elsif user_id
      user = User.find(user_id)
      render json: user.likes
    else
      render json: Like.all
    end
  rescue
    render text: 'User not found', status: :not_found
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: like
  rescue
    render text: 'Like not found', status: :not_found
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :likeable_id, :likeable_type)
  end

end
