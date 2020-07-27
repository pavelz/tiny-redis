require 'test_helper'

class User # can place this definition on app/models as well.
  include Tiny::Redis
  attr_accessor :email

  alias_method :index, :email
end

class Tiny::Redis::Test < ActiveSupport::TestCase
  test "connect to database and save an object. then load it." do
    u = User.new
    u.email = "email@email.com"
    assert(u.save(nil) != false)
    
    user = User.load("email@email.com")
    assert(user.email == "email@email.com")
  end
end
