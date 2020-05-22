class CompaniesController < ApplicationController
  before_action :set_company, only:[:show, :edit, :update, :destroy]

  def index
    @company = Company.new
    @data = Company.includes(:user).company_new.page(params[:page]).per(3)
    @plus = Company.joins(:user).count(:id)
    @like = Like.new
    @companies = Company.search(params[:keyword])
     respond_to do |format|
     format.html
     format.json
     end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path
    else 
      render :index, :notice => "登録されていません"
    end
  end

  def show
  end

  def edit
  end

  def update
    @company.update(company_params)
    redirect_to companies_path
  end

  def destroy
    @company.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :postcode, :phone_number, :capital, :sale, :description, :characteristic, :url).merge(user_id: current_user.id)
  end

  def set_company
    @company = Company.find(params[:id])
  end

end
