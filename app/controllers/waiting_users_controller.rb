class WaitingUsersController < ApplicationController
  http_auth_except %w(new create show)
  before_action :set_waiting_user, only: [:show, :edit, :update, :destroy, :accept]

  def index
    @q = WaitingUser.ransack(params[:q])
    @found = @q.result(distinct: true)
    @waiting_users = @found.page params[:page]
  end

  def show
  end

  def new
    @waiting_user = WaitingUser.new
  end

  def edit
  end

  def create
    @waiting_user = WaitingUser.new(waiting_user_params)

    respond_to do |format|
      if @waiting_user.save
        format.html { redirect_to static_pages_main_path, notice: 'Zostałeś wpisany na listę rezerwową. Poinformujemy Cię jeśli zwolni się miejce.' }
        format.json { render :show, status: :created, location: @waiting_user }
      else
        format.html { render :new }
        format.json { render json: @waiting_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @waiting_user.update(waiting_user_params)
        format.html { redirect_to @waiting_user, notice: 'Waiting user was successfully updated.' }
        format.json { render :show, status: :ok, location: @waiting_user }
      else
        format.html { render :edit }
        format.json { render json: @waiting_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @waiting_user.destroy
    respond_to do |format|
      format.html { redirect_to waiting_users_url, notice: 'Waiting user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    WaitingUsers::Accept.new(@waiting_user).call
    redirect_to waiting_users_path, notice: I18n.t('user_accepted')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiting_user
      @waiting_user = WaitingUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiting_user_params
      params.require(:waiting_user)
          .permit(
              :first_name,
              :last_name,
              :email,
              :gender,
              :city,
              :phone,
              :fellowship,
              :days,
              :category_id
          )
    end
end
