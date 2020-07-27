require 'test_helper'

class Tiny::Redis::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Tiny::Redis
  end
end
