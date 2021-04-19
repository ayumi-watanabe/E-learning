class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params:[:id])
  end

  def create
    @user = User.new(parmas[:user])
    if @user.save
    flash[:success]="Saved successfully!"
    redirect_to login_url
    else
    flash[:danger]="Invalid content. Try again"
      render 'new'  
    end
  end

end
