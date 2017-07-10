class StaticPagesController < ApplicationController
  def main
    @donate = Donate.new
  end

  def schedule
  end

  def details
  end

  def support
  end

  def contact
  end

  def faq
  end
end
