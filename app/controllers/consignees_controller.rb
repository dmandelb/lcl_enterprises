class ConsigneesController < ApplicationController
  skip_before_action :ensure_login, only: :create
  def new
    @consignee = Consignee.new
    render '_form'
  end

  def create
    @consignee = Consignee.new(consignee_params)
    if @consignee.save
      session[:consignee_id] = @consignee.id
      redirect_to @consignee
    else
      @errors = @consignee.errors.full_messages
      render '_form'
    end
  end

  def show
    @consignee = Consignee.find_by(id: params[:id])
    verify_authorized
    @lcls = @consignee.lcls
  end

  def edit
    @consignee = Consignee.find_by(id: params[:id])
    verify_authorized
    render '_form'
  end

  def update
    @consignee = Consignee.find_by(id: params[:id])
    verify_authorized
    if @consignee.update(consignee_params)
      redirect_to @consignee
    else
      @errors = @consignee.errors.full_messages
      render '_form'
    end
  end

  private
  def consignee_params
    params.require(:consignee).permit(:name, :phone, :email, :password, :password_confirmation)
  end

  def verify_authorized
    redirect_to root_path unless current_user == @consignee
  end
end
