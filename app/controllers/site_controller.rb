class SiteController < ApplicationController
  before_action :is_authenticated, only: [:index]

  def index
    # render :json => params
  end

  def privacy
  end

  def terms
  end
end
