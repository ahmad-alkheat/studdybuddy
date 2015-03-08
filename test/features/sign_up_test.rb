require "test_helper"

class SignUpTest < Capybara::Rails::TestCase
  test "Sign_up" do
    visit '/users/sign_up'
    #assert_equal "hi", page.body
    fill_in 'user_email', :with => '11kasa@queensu.ca'
    fill_in 'user_name', :with => 'Ahmad Al-kheat'
    select 'Law', :from => 'user_department'
    select 'MALE', :from => 'user_gender'
    fill_in 'user_password', :with => '12345678'
    fill_in 'user_password_confirmation', :with => '12345678'
    click_button 'Sign up'
    assert page.has_content?("A message with a confirmation link has been sent to your email address. Please follow the link to activate your account")
    assert 'users/sign_in', current_path
  end
end
