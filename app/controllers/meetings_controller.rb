class MeetingsController < ApplicationController
  include EmojiComplete
  before_action :require_active_current_user
  before_action :require_privilege, only: [:update]
  before_action :set_meeting, only: [:show, :edit, :update]
  before_action :set_emoji_completion, only: [:new, :edit]

  def index
    @meetings = Meeting.order(start_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  def new
    @meeting = Meeting.new
  end

  def create
    Meeting.new(meeting_params).save
    redirect_to meetings_path
  end

  def edit
  end

  def update
    if @meeting.update(meeting_params)
      redirect_to meeting_path(@meeting)
    else
      render :edit
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:name, :start_at, :end_at, :juried, :content)
  end
end
