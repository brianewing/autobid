class SiteController < ApplicationController
  def index
  end

  def logout
    reset_session
    redirect_to :root
  end
end
