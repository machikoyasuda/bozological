class UsersController < ApplicationController
  def index
    @users = User.all #.all is a method on ActiveRecord base object
  end

  def show
    # render :text => params[:id]
    @user = User.find params[:id]
  end

  def new
  end

  def edit
  end

  def create
    redirect_to users_path, status:303
  end

  def update
    redirect_to users_path, status:303
  end

  def destroy
    redirect_to users_path, status:303
  end

end
