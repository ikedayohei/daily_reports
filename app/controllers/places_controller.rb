class PlacesController < ApplicationController
  
  
  
  def create
    @place =Place.create(place_params)
    redirect_to new_report_path(current_user.id)
  end

  private
  def place_params
    params.require(:place).permit(:where).merge(user_id: current_user.id)
  end

end
