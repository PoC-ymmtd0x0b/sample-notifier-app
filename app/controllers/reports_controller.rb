class ReportsController < ApplicationController
  before_action :set_report, only: %i[show]
  before_action :set_my_report, only: %i[edit update destroy]

  # GET /reports or /reports.json
  def index
    @reports = Report.all.order(:id)
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id

    if @report.save
      Newspaper.publish(:notify_first_report, @report) if @report.first?
      redirect_to report_url(@report), notice: '日報を作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1 or /reports/1.json
  def update
    if @report.update(report_params)
      redirect_to report_url(@report), notice: '日報が更新されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy

    redirect_to reports_url, notice: '日報を削除しました'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    def set_my_report
      @report = current_user.reports.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :description)
    end
end
