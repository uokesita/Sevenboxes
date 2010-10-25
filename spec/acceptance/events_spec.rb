require File.dirname(__FILE__) + '/../spec_helper'

feature "User without account" do
  scenario "An user should be able to see the latest events" do
    @event = Event.create( :title=>"The event title", :description=>"the event description", :link=>"http://thelink.com", :date=>"2010-10-25 02:56:51", :user_id=>1  )
    
    visit '/'
    page.should have_content "The event title"
    page.should have_content "The event description"
  end
end