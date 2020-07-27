require 'test_helper'

class User
  include Tiny::Redis
  attr_accessor :email

  alias_method :index, :email
end

class Tiny::Redis::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Tiny::Redis
  end

  test "connect" do
    u = User.new
    u.email = "email@email.com"
    u.save(nil)
  end
end
