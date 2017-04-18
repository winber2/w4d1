class UsersController < ApplicationController
  def index
    if query = params[:query]
      query = "%#{query.downcase}%"
      users = User.where("LOWER(username) LIKE (?)", query)
      render json: users
    else
      render json: User.all
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  rescue
    render text: 'User not found', status: :not_found
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  rescue
    if user
      render json: user.errors.full_messages, status: :unprocessable_entity
    else
      render text: 'User not found', status: :not_found
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  rescue
    render text: 'oops', status: :not_found
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end
