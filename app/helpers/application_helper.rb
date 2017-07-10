module ApplicationHelper
  def checked(condition)
    condition ? fa_icon("check") : '?'
  end

  def yes_no(condition)
    condition ? fa_icon("plus") : '-'
  end
end
