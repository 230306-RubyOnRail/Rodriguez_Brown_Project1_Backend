class UserController < ApplicationController
  include Authenticatable
  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      render json: {message: 'User created successfully' }, status: :ok
    else
      render json: { message: 'Error creating user' }, status: :unprocessable_entity
    end
  end

  def show
    user = User.all
    render json: user, status: :ok
  end

  def destroy
    user = User.find(params[:id])
    if user.present?
      user.delete
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { message: 'Error deleting user' }, status: :unprocessable_entity
    end
  end
end
