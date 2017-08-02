class DonatesController < ApplicationController
  http_auth_except %w(new create show)
  before_action :set_donate, only: [:show, :edit, :update, :destroy, :set_received]

  def index
    @q = Donate.ransack(params[:q])
    @donates = @q.result(distinct: true).page params[:page]
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
    if @donate.update(donate_params)
      redirect_to donates_path, notice: 'Zaktualizowano wpis'
    else
      render :edit
    end
  end

  def destroy
    @donate.destroy
    redirect_to donates_url, notice: 'Deklaracja usunięta'
  end

  def set_received
    Donates::SetReceived.new(@donate).call
    redirect_to donates_url, notice: 'Wysłano E-mail z linkiem rejestracyjnym'
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
