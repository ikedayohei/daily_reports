class CompaniesController < ApplicationController
  def index
    @companies = Company.all.includes(:user)
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :postcode, :phone_number, :capital, :sale, :description, :characteristic)
  end
end
