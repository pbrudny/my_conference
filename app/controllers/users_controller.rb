class UsersController < ApplicationController
  http_auth_except
  before_action :set_user, only: [:show, :edit, :update, :destroy, :select]

  def index
    @q = User.ransack(params[:q])
    @found = @q.result(distinct: true)
    @users = @found.page params[:page]
    if params['commit'] == 'Zaznacz wyszukane'
      @found.each { |u| u.update_attribute(:selected, true) }
    end
    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv }
    end
  end

  def unselect
    User.all.each { |u| u.update_attribute(:selected, false) }
    redirect_to users_url
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

  def select
    @user.update_attribute(:selected, !@user.selected)
    redirect_to users_url
  end

  def update
    if @user.update(user_params)
      redirect_to users_url, notice: t('user.updated')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: t('user.destroyed')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params
          .require(:user)
          .permit(:first_name, :last_name, :email, :city, :phone, :fellowship, :first_time, :companions, :category_id)
    end
end
