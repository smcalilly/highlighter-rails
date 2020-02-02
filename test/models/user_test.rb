require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @good_user = users(:sylvia)
    @potential_user = User.new(email: 'user@gmail.com', password: 'password1')
  end

  test 'valid user' do
    assert @good_user.valid?
  end

  test 'email must not be blank' do
    @potential_user.email = '     '
    assert_not @potential_user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @potential_user.email = valid_address
      assert @potential_user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com, foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @potential_user.email = invalid_address
        assert_not @potential_user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @good_user.dup
    duplicate_user.email = @good_user.email.upcase
    @good_user.save
    assert_not duplicate_user.valid?
  end

  test 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @potential_user.email = mixed_case_email
    @potential_user.save
    assert_equal mixed_case_email.downcase, @potential_user.reload.email
  end

  test 'Password should be present (nonblank)' do
    @potential_user.password = ' ' * 6
    assert_not @potential_user.valid?
  end

  test 'password must be at least 6 characters' do
    @potential_user.password = 'nosix'
    assert_not @potential_user.valid?
  end
end
