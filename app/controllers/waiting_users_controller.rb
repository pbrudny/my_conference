class WaitingUsersController < ApplicationController
  http_basic_authenticate_with name: 'tlr', password: 'mark16', except: %w(new create show)
  before_action :set_waiting_user, only: [:show, :edit, :update, :destroy]

  # GET /waiting_users
  # GET /waiting_users.json
  def index
    @waiting_users = WaitingUser.all
  end

  # GET /waiting_users/1
  # GET /waiting_users/1.json
  def show
  end

  # GET /waiting_users/new
  def new
    @waiting_user = WaitingUser.new
  end

  # GET /waiting_users/1/edit
  def edit
  end

  # POST /waiting_users
  # POST /waiting_users.json
  def create
    @waiting_user = WaitingUser.new(waiting_user_params)

    respond_to do |format|
      if @waiting_user.save
        format.html { redirect_to static_pages_main_path, notice: 'Zostałeś wpisany na listę rezerwową. Poinformujemy Cię jeśli znajdzie się miejce' }
        format.json { render :show, status: :created, location: @waiting_user }
      else
        format.html { render :new }
        format.json { render json: @waiting_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waiting_users/1
  # PATCH/PUT /waiting_users/1.json
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

  # DELETE /waiting_users/1
  # DELETE /waiting_users/1.json
  def destroy
    @waiting_user.destroy
    respond_to do |format|
      format.html { redirect_to waiting_users_url, notice: 'Waiting user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waiting_user
      @waiting_user = WaitingUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waiting_user_params
      params.require(:waiting_user).permit(:first_name, :last_name, :email, :phone, :fellowship, :city, :category_id)
    end
end
