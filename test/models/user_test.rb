require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'john@example.com', password: 'asdlfkjasdf')
    user.save(validate: false)
    assert user.valid?
 end

  test 'invalid without name' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    user = User.new(name: 'John')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end
end
# 
#  test 'invalid without name' do
#  end
#
#  test 'invalid without email' do
#  end
# end
