class PageCommentsController < ApplicationController
  before_action :require_active_current_user

  def create
    @page_comment = PageComment.create(page_comment_params)

    redirect_to page_path(path: @page_comment.page.path)
  end

  private

  def page_comment_params
    params.require(:page_comment).permit(:page_id, :content).merge({ user: @current_user })
  end
end
