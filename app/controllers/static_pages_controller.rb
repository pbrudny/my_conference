class StaticPagesController < ApplicationController
  def main
    @donate = Donate.new
  end

  def schedule
  end
end
