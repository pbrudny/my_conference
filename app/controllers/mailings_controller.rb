class MailingsController < ApplicationController
  before_action :set_mailing, only: [:show, :edit, :update, :destroy, :send_to_all, :send_to_selected]

  def index
    @mailings = Mailing.all
  end

  def show
  end

  def new
    @mailing = Mailing.new
  end

  def edit
  end

  def create
    @mailing = Mailing.new(mailing_params)

    respond_to do |format|
      if @mailing.save
        format.html { redirect_to @mailing, notice: 'Mailing was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @mailing.update(mailing_params)
        format.html { redirect_to @mailing, notice: 'Mailing was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @mailing.destroy
    respond_to do |format|
      format.html { redirect_to mailings_url, notice: 'Mailing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_to_all
    Mailings::SendToAll.new(@mailing).call
    redirect_to mailings_path, notice: 'E-mail został wysłany do wszystkich uczestników.'
  end

  def send_to_selected
    Mailings::SendToSelected.new(@mailing).call
    redirect_to mailings_path, notice: 'E-mail został wysłany do wybranych uczestników.'
  end

  private
    def set_mailing
      @mailing = Mailing.find(params[:id])
    end

    def mailing_params
      params.require(:mailing).permit(:title, :body, :sent_at)
    end
end
