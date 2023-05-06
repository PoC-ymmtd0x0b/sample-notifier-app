class PracticesController < ApplicationController
  before_action :set_practice, only: %i[ show edit update destroy ]

  def index
    @practices = Practice.all
  end

  def show
  end

  def new
    @practice = Practice.new
    @practice.practices_books.new
  end

  def edit
    @practice.practices_books.new
  end

  def create
    @practice = Practice.new(practice_params)

    if @practice.save
      redirect_to practice_url(@practice), notice: "プラクティスを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @practice.update(practice_params)
      redirect_to practice_url(@practice), notice: "プラクティスが更新されました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @practice.destroy

    redirect_to practices_url, notice: "プラクティスが削除されました"
  end

  private
    def set_practice
      @practice = Practice.find(params[:id])
    end

    def practice_params
      params.require(:practice).permit(
        :title,
        :description,
        practices_books_attributes: %i[id book_id]
      )
    end
end
