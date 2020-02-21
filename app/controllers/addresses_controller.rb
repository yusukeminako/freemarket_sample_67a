class AddressesController < ApplicationController

  def show
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to "/addresses/#{current_user.id}"
    else
      redirect_to "/addresses/#{current_user.id}/edit"
    end
  end

  private
  def address_params
   params.require(:address).permit(
    :zip_code,
    :prefecture,
    :city,
    :address1,
    :address2,
    :landline
   ).merge(user_id: current_user.id)
  end

end