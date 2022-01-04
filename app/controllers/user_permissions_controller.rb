class UserPermissionsController < ApplicationController
  before_action :set_user_permission, only: %i[ show edit update destroy ]

  # GET /user_permissions or /user_permissions.json
  def index
    @user_permissions = UserPermission.all
    authorize @user_permissions
  end

  # GET /user_permissions/1 or /user_permissions/1.json
  def show
  end

  # GET /user_permissions/new
  def new
    @user_permission = UserPermission.new
    authorize @user_permission
  end

  # GET /user_permissions/1/edit
  def edit
  end

  # POST /user_permissions or /user_permissions.json
  def create
    @user_permission = UserPermission.new(user_permission_params)
    authorize @user_permission

    respond_to do |format|
      if @user_permission.save
        format.html { redirect_to user_permissions_url, notice: "User permission was successfully created." }
        format.json { render :show, status: :created, location: @user_permission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_permissions/1 or /user_permissions/1.json
  def update
    respond_to do |format|
      if @user_permission.update(user_permission_params)
        format.html { redirect_to @user_permission, notice: "User permission was successfully updated." }
        format.json { render :show, status: :ok, location: @user_permission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_permissions/1 or /user_permissions/1.json
  def destroy
    @user_permission.destroy
    authorize @user_permission
    respond_to do |format|
      format.html { redirect_to user_permissions_url, notice: "User permission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_permission
      @user_permission = UserPermission.find(params[:id])
      authorize @user_permission
    end

    # Only allow a list of trusted parameters through.
    def user_permission_params
      params.require(:user_permission).permit(:name)
    end
end
