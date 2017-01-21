class SessionsController < ApplicationController
  def login
  end

  def create
    @consignee = Consignee.find_by(name: params[:name])
    if @consignee && @consignee.authenticate(params[:password])
      session[:consignee_id] = @consignee.id
      redirect_to root_path
    else
      @errors = ["Incorrect name or password"]
      render "login"
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
