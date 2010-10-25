class Event < ActiveRecord::Base
  #pagination
  cattr_reader :per_page
  @@per_page = 5
  
  #associations
  belongs_to :user 
  
  #validation
  validates_presence_of :title, :message => "You must provide a title"
  validates_presence_of :description, :message => "You must provide a description"
  validates_presence_of :link, :message => "You must provide a link"
  validates_format_of   :link, :with => /^(#{URI::regexp(%w(http https))})$|^$/, :message => "Not a valid url"
  
  def listing_date
    date.strftime("%B %d, %Y - at %I:%M %p")
  end
  
  def slider_date 
    date.strftime(" - at %I:%M %p")
  end
  
end