require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "user with a valid email should be valid" do 
    user = User.new(email: "test@test.org", password_digest: "test") 
    assert user.valid? 
  end 

  test "user already exists" do 
    other_user = users(:one) 
    user = User.new(email: other_user.email, password_digest: "test") 
    assert_not user.valid? 
  end  
  

  test "incorrect email" do 
    user = User.new(email: "pratheekkv", password_digest: "test") 
    assert_not user.valid? 
  end    
  
end
