class ReportsController < ApplicationController
  def index
    @reports = Report.all
    @report = Report.new
  end

  def new
    @reports = Report.all
    @report = Report.new
    @data = {'2019-06-01' => 100, '2019-06-02' => 200, '2019-06-03' => 150}
  end

  def create
   @report = Report.create(report_params)
   redirect_to new_report_path(current_user.id)
  end

  def show
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
  end

  private
  def report_params
    params.require(:report).permit(:text, :where ,:reponder ,:companion, :date).merge(user_id: current_user.id)
  end
end
