class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(report_id: params[:report_id])
    bookmark.save!
    redirect_to new_report_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(report_id: params[:report_id]).destroy!
    redirect_to new_report_path, success: t('.flash.not_bookmark')
  end
end
