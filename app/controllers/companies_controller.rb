class CompaniesController < ApplicationController
  def index
    @companies = Company.all.includes(:user)
    @company = Company.new
    @data = Company.order("created_at DESC").page(params[:page]).per(3)
    @plus = Company.joins(:user).count(:id)
    @like = Like.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to companies_path
  end

  
  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to companies_path
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :postcode, :phone_number, :capital, :sale, :description, :characteristic, :url).merge(user_id: current_user.id)
  end
end
