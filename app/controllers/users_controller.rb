class UsersController < ApplicationController
  http_auth_except [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :select]
  before_action :set_language

  def index
    @q = User.ransack(params[:q])
    if params[:s]
      @found = @q.result(distinct: true)
    else
      @found = @q.result(distinct: true).order(:id)
    end
    @users = @found.page params[:page]
    if params['commit'] == 'Zaznacz wyszukane'
      @found.each { |u| u.update_attribute(:selected, true) }
    end
    respond_to do |format|
      format.html
      format.csv { send_data User.all.to_csv }
    end
  end

  def unselect
    User.all.each { |u| u.update_attribute(:selected, false) }
    redirect_to_users_keeping_results
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
    redirect_to_users_keeping_results
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

    def redirect_to_users_keeping_results
      if params[:q]
        q_key, q_value = params[:q].split('=')
        redirect_to users_url(q: {q_key => q_value}, page: params[:page])
      else
        redirect_to users_url
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_language
      lang = params[:lang] || session[:lang]
      I18n.default_locale = session[:lang] = lang if lang
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params
          .require(:user)
          .permit(
              :first_name,
              :last_name,
              :email,
              :gender,
              :country,
              :city,
              :phone,
              :fellowship,
              :days,
              :first_time,
              :companions,
              :category_id
          )
    end
end
