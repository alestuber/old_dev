require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:alex)
    @other_user = users(:mauricio)
  end

  # Devise validations tests
  test "email should be unique" do
    @other_user.email = @user.email
    assert_not @other_user.valid?
  end

  test "email should be case insensitive" do
    @other_user.email = @user.email.upcase
    assert_not @other_user.valid?
  end

  test "email adresses should be saved as lowercase" do
    mixed_case_email = "Bla@BlAkE.cOm"
    @user.email = mixed_case_email
    @user.save
    @user.confirm!
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn alexandre.stuber@mercadofresh.com.br]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end

  end

  test "email validation should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end

  end

  test "password should have at least 6 characters" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "a" * 6
    assert @user.valid?
  end

  test "password should match password confirmation on create" do
    user_dup = @user.dup
    user_dup.email = "kjdksjkdkjskj@dskjkdskjsd.com"
    user_dup.cpf = "36944228893"
    user_dup.password = "password"
    user_dup.password_confirmation = "paSsword"
    assert_not user_dup.valid?
  end

  test "password should be present on create and cannot be blank or nil" do
    user_dup = @user.dup
    user_dup.email = "kjdkj@dskjkdskjsd.com"
    user_dup.cpf = "36946227793"
    user_dup.password = user_dup.password_confirmation = "     "
    assert_not user_dup.valid?
    user_dup.password = user_dup.password_confirmation = nil
    assert_not user_dup.valid?
    user_dup.password = user_dup.password_confirmation = ""
    assert_not user_dup.valid?
  end

  # End of devise

  test "should be valid" do
    assert @user.valid?
  end

  # test "first name should be present" do
  #   @user.first_name = "    "
  #   assert_not @user.valid?
  #   @user.first_name = nil
  #   assert_not @user.valid?
  # end

  # test "last name should be present" do
  #   @user.last_name = "    "
  #   assert_not @user.valid?
  #   @user.last_name = nil
  #   assert_not @user.valid?
  # end





  # test "name should not be too long" do
  #   @user.name = "a" * 51
  #   assert_not @user.valid?
  # end

  # test "email should not be too long" do
  #   @user.email = "a" * 244 + "@example.com"
  #   assert_not @user.valid?
  # end

  # test "authenticated? should return false for a user with nil digest" do
  #   assert_not @user.authenticated?(:remember , '')
  # end

  # test "associated microposts should be destroyed" do
  #   @user.save
  #   @user.microposts.create!(content: "blablabla")
  #   assert_difference "Micropost.count", -1 do
  #     @user.destroy
  #   end
  # end

  # test "should follow and unfollow a user" do
  #   alex = users(:alex)
  #   archer = users(:archer)
  #   assert_not alex.following?(archer)
  #   assert_not archer.followed_by?(alex)
  #   alex.follow(archer)
  #   assert alex.following?(archer)
  #   assert archer.followed_by?(alex)
  #   alex.unfollow(archer)
  #   assert_not alex.following?(archer)
  #   assert_not archer.followed_by?(alex)
  # end

  # test "feed should have the right posts" do
  #   alex = users(:alex)
  #   archer = users(:archer)
  #   lana = users(:lana)
  #   lana.microposts.each do |post_following|
  #     assert alex.feed.include?(post_following)
  #   end
  #   alex.microposts.each do |post_self|
  #     assert alex.feed.include?(post_self)
  #   end
  #   archer.microposts.each do |post_unfollowed|
  #     assert_not alex.feed.include?(post_unfollowed)
  #   end
  # end
end
