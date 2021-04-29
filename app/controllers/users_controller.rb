class UsersController < ApplicationController
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

  private
    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
