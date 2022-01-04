class RidingsController < ApplicationController
  before_action :set_riding, only: %i[ show edit update destroy bank_balance bank_balance_update]

  # GET /ridings or /ridings.json
  def index
    @ridings = policy_scope(Riding).order(riding_code: :asc)

    if @ridings.size == 1
      redirect_to @ridings.first
    end
    
    authorize @ridings
  end

  # GET /ridings/1 or /ridings/1.json
  def show
    authorize @riding

    @reports = policy_scope(RidingExternalReport).where(riding: @riding)
  end

  # GET /ridings/new
  def new
    @riding = Riding.new
  end

  # GET /ridings/1/edit
  def edit
  end

  # POST /ridings or /ridings.json
  def create
    @riding = Riding.new(riding_params)

    respond_to do |format|
      if @riding.save
        format.html { redirect_to @riding, notice: "Riding was successfully created." }
        format.json { render :show, status: :created, location: @riding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @riding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ridings/1 or /ridings/1.json
  def update
    respond_to do |format|
      if @riding.update(riding_params)
        format.html { redirect_to @riding, notice: "Riding was successfully updated." }
        format.json { render :show, status: :ok, location: @riding }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @riding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ridings/1 or /ridings/1.json
  def destroy
    @riding.destroy
    respond_to do |format|
      format.html { redirect_to ridings_url, notice: "Riding was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bank_balance
  end

  def bank_balance_update
    BankBalance.create(balance: params[:balance], riding: @riding)
    redirect_to @riding, notice: "Bank balance was successfully updated."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_riding
      @riding = Riding.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def riding_params
      params.require(:riding).permit(:name_en, :name_fr, :riding_code, :province_en, :province_fr, :member_name_en, :member_name_fr, 
        :member_affiliation_en, :member_affiliation_fr, :riding_type_en, :riding_type_fr, :region_en, :region_fr)
    end
end
