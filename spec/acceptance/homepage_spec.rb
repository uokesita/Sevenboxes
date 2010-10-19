require File.dirname(__FILE__) + '/../spec_helper'

feature "Browsing the home page" do

  scenario "Visit the home page should have some stuff" do
    visit '/'
    page.should have_content 'Sign up'
    page.should have_content 'Sign in'
  end
  
end