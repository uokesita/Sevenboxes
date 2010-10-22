class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :set_user_time_zone
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if current_user
  end
  
  def index
    
  end
end
