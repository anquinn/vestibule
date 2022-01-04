class BankBalancesController < ApplicationController
  before_action :set_bank_balance, only: %i[ destroy ]

  # GET /bank_balances/new
  def new
    @bank_balance = BankBalance.new
    @riding = Riding.friendly.find(params[:riding_id])
  end

  # POST /bank_balances or /bank_balances.json
  def create
    @riding = Riding.friendly.find(params[:riding_id])
    @bank_balance = BankBalance.new(bank_balance_params)
    @bank_balance.riding_id = @riding.id

    respond_to do |format|
      if @bank_balance.save
        format.html { redirect_to riding_url(@bank_balance.riding), notice: "Bank balance was successfully updated" }
        format.json { render :show, status: :created, location: @bank_balance }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bank_balance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_balances/1 or /bank_balances/1.json
  def destroy
    @bank_balance.destroy

    respond_to do |format|
      format.html { redirect_to bank_balances_url, notice: "Bank balance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_balance
      @bank_balance = BankBalance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_balance_params
      params.require(:bank_balance).permit(:balance, :balance_cents, :riding_id)
    end
end
