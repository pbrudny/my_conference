class DonatesController < ApplicationController
  http_basic_authenticate_with name: 'tlr', password: 'mark16', except: %w(create show)
  before_action :set_donate, only: [:show, :edit, :update, :destroy]

  def index
    @donates = Donate.all
  end

  def show
  end

  def new
    @donate = Donate.new
  end

  def edit
  end

  def create
    create_donate = Donates::Create.new(donate_params)
    create_donate.call
    @donate = create_donate.donate
    if @donate.valid?
      redirect_to @donate, notice: 'Dziękujemy za deklarację wpłaty.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @donate.update(donate_params)
        format.html { redirect_to @donate, notice: 'Donate was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @donate.destroy
    respond_to do |format|
      format.html { redirect_to donates_url, notice: 'Donate was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donate
      @donate = Donate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donate_params
      params.require(:donate).permit(:amount, :email, :first_name, :last_name, :received)
    end
end
