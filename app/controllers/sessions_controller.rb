class SessionsController < ApplicationController
  def new
  end

  def create
  	redirect_to root_url
  end

  def destory
  	redirect_to login_url
  end
end
