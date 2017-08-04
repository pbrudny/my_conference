class TeamMembersController < ApplicationController
  http_auth_except %w(main new create show)

  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  def main
  end

  def index
    @team_members = TeamMember.all
  end

  def show
  end

  def new
    @team_member = TeamMember.new
  end

  def edit
  end

  def create
    @team_member = TeamMember.new(team_member_params)

    respond_to do |format|
      if @team_member.save
        notice = 'Team member added!'
        if @team_member.accommodation
          notice += ' We would contact you about accommodation.'
        end
        format.html { redirect_to main_team_members_path, notice: notice }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @team_member.update(team_member_params)
        format.html { redirect_to @team_member, notice: 'Team member was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to team_members_url, notice: 'Team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      params.require(:team_member)
          .permit(:first_name, :last_name, :email, :accommodation, :pts, :jesus_hotel_staff, :phone, :gender)
    end

    def set_default_locale
      I18n.default_locale = :en
    end
end
