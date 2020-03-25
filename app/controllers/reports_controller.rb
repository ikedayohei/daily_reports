class ReportsController < ApplicationController
  def index
    @reports = Report.all.includes(:user)
    @report = Report.new
    @company = Company.all
    @company = Company.new
  end

  def new
    @reports = Report.all
    @reports = Report.order("created_at DESC").page(params[:page]).per(3)
    @sum = Report.joins(:user).group("users.name").order("count_all DESC").count
    @like =Like.all
    @ranking = Like.joins(:company).group("companies.name").order("count_all DESC").count
  end

  def create
   @report = Report.create(report_params)
   redirect_to new_report_path(current_user.id)
  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments
    @comment = Comment.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    report = Report.find(params[:id])
    report.update(report_params)
    redirect_to new_report_path(current_user.id)
  end

  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to root_path
  end
  
  def bookmarks
    @reports = current_user.bookmark_reports.includes(:user).recent
  end

  private
  def report_params
    params.require(:report).permit(:text, :where ,:reponder ,:companion, :date ).merge(user_id: current_user.id)
  end
end
