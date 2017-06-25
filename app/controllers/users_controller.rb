class UsersController < ApplicationController
  http_basic_authenticate_with name: 'tlr', password: 'mark16', except: %w(new create show)
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @token = params[:token]
    email = Donate.find_by(token: @token).try(:email)
    @user = User.new(email: email)
  end

  def edit
  end

  def create
    create_user = Users::Create.new(user_params, params[:token])
    create_user.call
    @user = create_user.user
    if @user.valid?
      redirect_to @user, notice: I18n.t('user.created')
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :fellowship, :first_time)
    end
end
