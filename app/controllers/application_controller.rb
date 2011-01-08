class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :set_user_time_zone
  
  def set_user_time_zone
    Time.zone = current_user.time_zone if current_user
  end
  
  def index
    page = params[:page] || 1
    
    @live_now = Event.find( :all, 
                            :order=>"date desc", 
                            :limit=>"3", 
                            :conditions => ["date > ? and date < ?", (DateTime.now - 10.minutes), (DateTime.now + 10.minutes) ] )
    
    @upcomming_events = Event.find( :all, 
                                    :order=>"date desc", 
                                    :limit=>"3", 
                                    :conditions => ["date > ? and date < ?", DateTime.now, (DateTime.now + 6.hours) ] )
    
    @latest_submited_events = Event.paginate( :all, :order=>"updated_at desc", :page=> page )
  end
end
