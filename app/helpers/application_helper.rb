module ApplicationHelper
  def checked(condition)
    condition ? fa_icon("check") : '?'
  end
end
