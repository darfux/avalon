require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create successfully" do
    assert_nothing_raised(ActiveRecord::RecordInvalid) do
      User.create!({account: :test, nickname: :test, password: 123, password_confirmation: 123})
    end
    assert_nothing_raised(ActiveRecord::RecordInvalid) do
      User.create!({account: :test1, password: 123, password_confirmation: 123})
    end
  end
end
