class PagesController < ApplicationController
  include EmojiComplete
  include PageSetter
  before_action :require_active_current_user
  before_action :set_page, except: :index
  before_action :set_new_comment, only: :show
  before_action :set_emoji_completion, only: [:show, :edit]

  def index
    @pages = Page.all
  end

  def show
  end

  def edit
    @page = Page.new(path: params[:path]) if @page.blank?
  end

  def update
    if @page.blank?
      @page = Page.create(page_params)
    else
      @page.update(page_params)
    end

    redirect_to page_path(path: @page.path)
  end

  def rename
  end

  private

  def set_new_comment
    @comment = PageComment.new(page: @page) if @page.present?
  end

  def page_params
    params.require(:page).permit(:path, :title, :content).merge(user: @current_user)
  end
end
