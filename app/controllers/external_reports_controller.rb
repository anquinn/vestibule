class ExternalReportsController < ApplicationController
  before_action :set_external_report, only: %i[ show edit update destroy ]

  # GET /external_reports or /external_reports.json
  def index
    @external_reports = ExternalReport.all
    authorize @external_reports
  end

  # GET /external_reports/1 or /external_reports/1.json
  def show
  end

  # GET /external_reports/new
  def new
    @external_report = ExternalReport.new
    authorize @external_report
  end

  # GET /external_reports/1/edit
  def edit
  end

  # POST /external_reports or /external_reports.json
  def create
    @external_report = ExternalReport.new(external_report_params)

    respond_to do |format|
      if @external_report.save
        format.html { redirect_to @external_report, notice: "External report was successfully created." }
        format.json { render :show, status: :created, location: @external_report }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @external_report.errors, status: :unprocessable_entity }
      end
    end
    authorize @external_report
  end

  # PATCH/PUT /external_reports/1 or /external_reports/1.json
  def update
    respond_to do |format|
      if @external_report.update(external_report_params)
        format.html { redirect_to @external_report, notice: "External report was successfully updated." }
        format.json { render :show, status: :ok, location: @external_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @external_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_reports/1 or /external_reports/1.json
  def destroy
    @external_report.destroy
    respond_to do |format|
      format.html { redirect_to external_reports_url, notice: "External report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_report
      @external_report = ExternalReport.find(params[:id])
      authorize @external_report
    end

    # Only allow a list of trusted parameters through.
    def external_report_params
      params.require(:external_report).permit(:name_en, :name_fr, :description_en, :description_fr)
    end
end
