require File.dirname(__FILE__) + '/../spec_helper'

feature "User without account" do  
  scenario "An user should be able to create an account" do
    visit '/'
    click_link 'Sign up'
    fill_in('Email',                 :with => 'test@mail.com')
    fill_in('Password',              :with => '1234567890')
    fill_in('Password confirmation', :with => '1234567890')
    click_button('Sign up')
    @user = User.all()
    @user.should_not be(nil)
    page.should have_content 'You have signed up successfully. If enabled, a confirmation was sent to your e-mail.'
  end
end

feature "User with an account" do
  
  scenario "An user should be able to log in to his account" do
    @user = User.create(:email=>'test@mail.com', :password=>'1234567890')
    visit '/'
    click_link 'Sign in'
    fill_in('Email',    :with => 'test@mail.com')
    fill_in('Password', :with => '1234567890')
    click_button('Sign in')
    page.should have_content 'Signed in successfully.'    
  end
  
  scenario "An user should be able to log out from his account" do
    @user = User.create(:email=>'test@mail.com', :password=>'1234567890')
    visit '/'
    click_link 'Sign in'
    fill_in('Email',    :with => 'test@mail.com')
    fill_in('Password', :with => '1234567890')
    click_button('Sign in')
    page.should have_content 'Signed in successfully.'
    page.should have_content 'Sign out'
    click_link 'Sign out'
    page.should have_content 'Sign in'
  end
  
end