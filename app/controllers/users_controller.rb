class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
    authorize @users
  end

  def show
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    authorize @user

    # generate secure password as we'll only use google sign in
    password = Devise.friendly_token
    @user.password = password
    @user.password_confirmation = password

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    authorize @user
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def locale_switch
    if current_user.preferred_language == "en"
      current_user.update(preferred_language: "fr")
    else
      current_user.update(preferred_language: "en")
    end

    redirect_back fallback_location: root_path
  end

  def theme_switch
    if current_user.theme == "light"
      if current_user.update(theme: "dark")
        redirect_back fallback_location: root_path
      end
    else
      if current_user.update(theme: "light")
        redirect_back fallback_location: root_path
      end
    end
  end

  def lock_user
    user = User.find(params[:lock_user_id])
    user.lock_access!

    redirect_to user
  end

  def unlock_user
    user = User.find(params[:lock_user_id])
    user.unlock_access!

    redirect_to user
  end

  def impersonate
    user = User.find(params[:id])
    authorize :user, :impersonate?

    impersonate_user(user)
    redirect_to root_path
  end

  def stop_impersonating
    authorize :user, :stop_impersonating?
    stop_impersonating_user
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
        :user_type, :title, user_permission_ids:[], riding_ids:[])
    end

end
