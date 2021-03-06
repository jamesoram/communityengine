require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  fixtures :all

  test "should get new and respond with success" do
    get :new

    assert_response :success
  end

  test "should post to create and send an email" do
    assert_difference ActionMailer::Base.deliveries, :length, 1 do
      post :create, :email => users(:quentin).email
      assert_response :redirect
      assert_redirected_to login_path
    end
  end
  
  test "should get edit and respond with success" do
    get :edit, :id => users(:quentin).perishable_token    
    
    assert_response :success  
  end

  test "should patch to update and redirect to dashboard" do
    @user = users(:quentin)

    patch :update, :id => @user.perishable_token, :user => { :password => "newpassword" }

    assert_redirected_to dashboard_user_path(@user)    
  end

end