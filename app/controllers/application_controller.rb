class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def self.http_auth(except_actions=nil)
    http_basic_authenticate_with name: 'tlr', password: 'mark16', except: except_actions
  end
end
