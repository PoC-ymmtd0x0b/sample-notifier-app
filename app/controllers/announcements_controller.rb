class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[show]
  before_action :set_my_announcement, only: %i[edit update destroy]

  # GET /announcements or /announcements.json
  def index
    @announcements = Announcement.all.order(:id)
  end

  # GET /announcements/1 or /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
  end

  # POST /announcements or /announcements.json
  def create
    @announcement = Announcement.new(announcement_params)
    @announcement.user_id = current_user.id

    if @announcement.save
      redirect_to announcement_url(@announcement), notice: 'お知らせが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    if @announcement.update(announcement_params)
      redirect_to announcement_url(@announcement), notice: 'お知らせが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    @announcement.destroy

    redirect_to announcements_url, notice: 'お知らせが削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    def set_my_announcement
      @announcement = current_user.announcements.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:title, :description)
    end
end
