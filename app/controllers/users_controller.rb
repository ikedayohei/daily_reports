class UsersController < ApplicationController

  def ranking
    @user=  User.group(:report_id).order("count(report_id) desc")
  end

  def show
    @user = User.find(params[:id])
    @report = @user.reports.order("created_at DESC").page(params[:page]).per(3)
    @bookmarks = Bookmark.where("user_id = ?", @user).order("created_at DESC").page(params[:page]).per(3)
    @text = Report.joins(:user).count(:id)
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end
