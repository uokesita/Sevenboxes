class User < ActiveRecord::Base
  # To use devise-twitter don't forget to include the :twitter_oauth module:
  # e.g. devise :database_authenticatable, ... , :twitter_oauth

  # IMPORTANT: If you want to support sign in via twitter you MUST remove the
  #            :validatable module, otherwise the user will never be saved
  #            since it's email and password is blank.
  #            :validatable checks only email and password so it's safe to remove

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :twitter_oauth,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :time_zone  

  before_save :twitter_email

  private

  def twitter_email 
    if self.email == ''
      self.email = "#{self.twitter_handle}"
    end
  end

end
