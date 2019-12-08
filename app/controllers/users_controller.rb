class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all.order(created_at: :asc)
    render json: @users
  end

  def show
    render json: @user
  end

  def new
    @user = User.new
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :name, :email, :password, :password_confirmation, :region, :image,
                  :image_cache, :email, :subscription, :sex, :additional_information)
  end

end
