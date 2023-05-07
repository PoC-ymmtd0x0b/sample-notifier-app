class PagesController < ApplicationController
  before_action :set_page, only: %i[show]
  before_action :set_my_page, only: %i[edit update destroy]

  # GET /pages or /pages.json
  def index
    @pages = Page.all.order(:id)
  end

  # GET /pages/1 or /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id

    if @page.save
      redirect_to page_url(@page), notice: 'ドキュメントが作成されました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    if @page.update(page_params)
      redirect_to page_url(@page), notice: 'ドキュメントが更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy

    redirect_to pages_url, notice: 'ドキュメントが削除されました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def set_my_page
      @page = current_user.pages.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title, :body)
    end
end
