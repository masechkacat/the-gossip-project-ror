class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # params[:id] est l'id de l'URL
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if User.find_by(email: @user.email)
      flash.now[:error] = "User already exists. Please log in."
      redirect_to new_session_path
    elsif @user.save
      flash[:success] = "Account created successfully!"
      redirect_to new_session_path
    else
      flash.now[:error] = "Invalid user information. Please check the errors below."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(first_name: params[:first_name], last_name:params[:last_name], description:params[:description], email:params[:email], age:params[:age], city_id:params[:city_id], password:params[:password])
  end

  def destroy
    @user - User.destroy(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end

end
