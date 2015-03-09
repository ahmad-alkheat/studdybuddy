require "test_helper"

class SignInTest < Capybara::Rails::TestCase
  test "failed_sign_in" do
    visit '/users/sign_in'
    fill_in 'user_email', :with => '11kasa@queensu.ca'
    fill_in 'user_password', :with => '12345678'
    click_button 'Log in'
    assert '/users/sign_in', current_path
  end

  test "success_sign_in" do
    User.create(:email => '11kasa@queensu.ca', :name=> 'Ahmad', :department=> 'Law', :gender=> 'MALE', :password=> '12345678', :password_confirmation=> '12345678', :confirmed_at => Time.now)
    visit '/users/sign_in'
    fill_in 'user_email', :with => '11kasa@queensu.ca'
    fill_in 'user_password', :with => '12345678'
    click_button 'Log in'
    assert_equal '/', current_path
    assert page.has_content?('Logout')
  end

end
