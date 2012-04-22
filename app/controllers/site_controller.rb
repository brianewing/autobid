class SiteController < ApplicationController
  def index
    @models = Model.all(:include => :manufacturer).collect(&:full_name)
  end

  def logout
    reset_session
    redirect_to :root
  end

  def login
    if dealer = Dealer.login(params[:email], params[:password])
      session[:dealer_id] = dealer.id
    end

    redirect_to :root
  end
end
