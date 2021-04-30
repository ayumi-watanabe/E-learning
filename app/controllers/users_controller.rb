class UsersController < ApplicationController
  before_action :only_loggedin_users, only:[:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.paginate(page:params[:page], per_page: 10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success]="Saved successfully!"
      redirect_to root_url
    else
      flash[:danger]="Invalid content. Try again"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]= "Save successfully!"
       redirect_to @user
    else
      flash[:danger] = "Invalid content. Try again."
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to user_url
  end

  private
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
