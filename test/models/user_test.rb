require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # called before every single test
  def setup
    @user = create_test_user
    raise 'validate failed when step!' unless @user.valid?
  end
 
  # called after every single test
  def teardown
  end

  def create_test_user
    User.create({account: :test, nickname: :test, password: 123, password_confirmation: 123})
  end

  test "create successfully" do
    @test_user = User.new({account: :test1, nickname: :test1, password: 123, password_confirmation: 123})
    assert @test_user.valid?
    @test_user =  User.new({account: :test2, password: 123, password_confirmation: 123})
    assert @test_user.valid?
  end

  test "create duplicate" do
    @test_user = create_test_user
    assert_not_validate @test_user, {account: 'taken'}
  end

  test "create no password" do
    @test_user = User.new({account: :test1, nickname: :test1, password_confirmation: 123})
    assert_not_validate @test_user, {password: 'blank'}
  end

  test "create no password_confirmation" do
    @test_user = User.new({account: :test1, nickname: :test1, password: 123})
    assert_not_validate @test_user, {password_confirmation: 'blank'}
  end

  test "create wrong confirmation" do
    @test_user = User.new({account: :test1, nickname: :test1, password: 123, password_confirmation: 321})
    assert_not_validate @test_user, {password_confirmation: 'match Password'}
  end

  test "update successfully" do
    @test_user = User.find_by({account: :test})
    assert @test_user.update({password: 456})
    assert @test_user.update({account: 'another_test'})
    assert @test_user.update({nickname: 'niconiconi'})
    @test_user = User.find_by({account: 'another_test'})
    assert_not_nil @test_user
    assert @test_user.authenticate(456)
    assert_match 'niconiconi', @test_user.nickname
  end
end
