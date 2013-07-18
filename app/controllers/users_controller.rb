class UsersController < ApplicationController
  def index
    @users = User.all #.all is a method on ActiveRecord base object
  end

  def show
    # render :text => params[:id]
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    User = user.create(params[:user])

    if @user
      redirect_to users_path, status:303
    else
      render :new
    end
  end

  def update
    redirect_to users_path, status:303
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path, status:303
  end

end
