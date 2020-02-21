class ImagesController < ApplicationController
  def destroy
    image = Image.find(params[:id])
    if image.destroy
      redirect_to edit_product_path(image.product_id)
    else
      redirect_to edit_product_path(image.product_id)
    end
  end
end
