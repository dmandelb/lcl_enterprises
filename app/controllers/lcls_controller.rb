class LclsController < ApplicationController
  def new
    @lcl = Lcl.new
  end

  def create
    @lcl = Lcl.new(lcl_params)
    @lcl.consignee = current_user
    if @lcl.save
      redirect_to @lcl
    else
      @errors = @lcl.errors.full_messages
      render 'new'
    end
  end

  def show
    @lcl = Lcl.find_by(id: params[:id])
    verify_authorized
  end

  def edit
    @lcl = Lcl.find_by(id: params[:id])
    verify_authorized
    render '_form'
  end

  def update
    @lcl = Lcl.find_by(id: params[:id])
    verify_authorized
    @lcl.update(lcl_params)
    redirect_to @lcl
  end

  def register
    # This is where the lcl will be associated with a container
  end

  def arrived
    # This is where the consignee will be notified of arrival in port
  end

  private
  def lcl_params
    params.require(:lcl).permit(:description, :destination_name, :dest_lat, :dest_long)
  end

  def verify_authorized
    redirect_to root_path unless current_user == @lcl.consignee
  end
end
