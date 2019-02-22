class Admin::DashboardController < ApplicationController
  before_filter :http_basic_auth

  def http_basic_auth
    if ENV['HTTP_AUTH'] =~ %r{(.+)\:(.+)}
      unless authenticate_with_http_basic { |user, password|  user == $1 && password == $2 }
        request_http_basic_authentication
      end
    end
  end
  
  def show
  end
end
