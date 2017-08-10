class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_default_locale

  def self.http_auth_except(except_actions=nil)
    http_basic_authenticate_with name: User.admin_login, password: User.admin_password, except: except_actions
  end

  def set_default_locale
    I18n.default_locale = :pl
  end
end
