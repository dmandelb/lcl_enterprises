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
    if @lcl.update(lcl_params)
      redirect_to @lcl
    else
      @errors = @lcl.errors.full_messages
      render '_form'
    end
  end

  def register
    lcl = Lcl.find_by(id: params[:lcl_id])
    consignee = lcl.consignee
    # This is where the lcl will be associated with a container
    response = Unirest.post("", 'headers' : {'accept' : 'application/json','content-type'  : 'application/json'},
      'parameters' : {'token' : '4c6e5658457074684162456e464f5a476d55654361477a5753677373584952694e79786568776f4f676e6162', 'phone_numbers' : "347-720-9741 9176033714 9176965027"})
    response.code
  end

  def arrived
    # This is where the consignee will be notified of arrival in port
    # A container id will come in in the post request and all relevant LCLs will be notified
  end

  private
  def lcl_params
    params.require(:lcl).permit(:description, :destination_name, :dest_lat, :dest_long)
  end

  def verify_authorized
    redirect_to root_path unless current_user == @lcl.consignee
  end
end
