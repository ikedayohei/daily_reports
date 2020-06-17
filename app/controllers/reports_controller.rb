class ReportsController < ApplicationController
  before_action :set_report, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!,  except:[:index]

  def index
    @report = Report.new
  end

  def new
    @reports = Report.includes(:user).report_new.page(params[:page]).per(3)
    @sum = Report.joins(:user).group("users.name").ranking.count
    @like =Like.all.includes(:company)
    @ranking = Like.joins(:company).group("companies.name").ranking.count
  end

  def create
   @report = Report.new(report_params)
   if @report.save
    redirect_to new_report_path(current_user.id)
   else
    render :index, :notice => "登録されていません"
   end

  end

  def show
    @comments = @report.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @report.update(report_params)
     redirect_to new_report_path(current_user.id)
    else
     render :edit
    end
  end

  def destroy
    if @report.destroy
     redirect_to root_path
    else
     render :index
    end
  end
  
  def bookmarks
    @reports = current_user.bookmark_reports.includes(:user).recent
  end

  private
  def report_params
    params.require(:report).permit(:text, :where ,:reponder ,:companion, :date ).merge(user_id: current_user.id)
  end

  def set_report
   @report = Report.find(params[:id])
  end

end
