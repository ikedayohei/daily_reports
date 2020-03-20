class LikesController < ApplicationController
  before_action :company_params
  def create
    like = current_user.likes.new(company_id: @company.id)
    like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, company_id: @company.id).destroy
  end

  private 
  def company_params
    @company = Company.find(params[:company_id])
  end
end
