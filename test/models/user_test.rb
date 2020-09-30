require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "smth", email: "sm@sasdf.com")
  end

  test "user should valid" do
    assert @user.valid?
  end

  test "name should valid" do
    @user.name = "          "
    assert_not @user.valid?
  end

  test "email should valid" do
    @user.email = "          "
    assert_not @user.valid?
  end

  test "name should not be long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com SER@FOO.COM a-Us_eR@test.com 0a_.s+@a.c.jp]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "Address #{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject valid addresses" do
    invalid_addresses = %w[user@test,com user_at_test.org foo@bar_buz.com foo@bar+buz.com user@example.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "Address #{invalid_address.inspect} should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
