class CommentsController < ApplicationController
  
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to report_path(params[:report_id]) }
      format.json 
    end
 
  end

  def destroy
    report = Report.find(params[:report_id])
    @comment = report.comments.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: report_path(report))
  end 

   private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, report_id: params[:report_id])
  end
end


