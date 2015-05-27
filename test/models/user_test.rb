require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:alex)
    @other_user = users(:mauricio)
  end

  test "should all users be valid" do
    User.all.each do |user|
      assert user.valid?
    end
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
    # The respond_to :confirm! is here to make the test work if :confirmable
    #  (Devise) is off, since this test shouldn't depend on confirmable.
    @user.confirm! if @user.respond_to? :confirm!
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "email should be present and can't be blank" do
    @user.email = "    "
    assert_not @user.valid?
    @user.email = nil
    assert_not @user.valid?
  end

  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn alexandre.stuber@mercadofresh.com.br]

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

  test "account should not be activated until the email address is confirmed" do
    user = @user.dup
    user.email = "teste@teste.com.br"
    user.cpf = "83834427532"
    user.confirmed_at = nil
    assert_not user.active_for_authentication?
    user.confirmed_at = Time.now
    assert user.active_for_authentication?
  end

  test "new email should be unconfirmed when email is changed until the new address is confirmed" do
    assert @user.active_for_authentication?
    email = @user.email
    new_email = @user.email =  "teste@teste.com.br"
    @user.save
    @user.reload
    assert_equal email, @user.email
    assert_equal new_email, @user.unconfirmed_email
    @user.confirm!
    @user.reload
    assert_nil @user.unconfirmed_email
    assert_equal @user.email, new_email
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

  [:first_name, :last_name, :telephone, :date_of_birth, :cpf].each do |attrib|
    test "#{attrib} should be present" do
      @user[attrib] = "    "
      assert_not @user.valid?
      @user[attrib]   = nil
      assert_not @user.valid?
    end
  end

  test "telephone should have less or equal to 12 characters" do
    assert @user.telephone.size <= 12
    @user.telephone = "9" * 13
    assert_not @user.valid?
    @user.telephone = "9" * 12
    assert @user.valid?
  end

  test "birthdate should be of datetime type" do
    @user.date_of_birth = Time.now
    assert @user.valid?
  end

  test "cpf should be unique" do
    @other_user.cpf = @user.cpf
    assert_not @other_user.valid?
  end

  test "cpf should be exactly 11 characters" do
    @user.cpf = "9" * 12
    assert_not @user.valid?
    @user.cpf = "9" * 10
    assert_not @user.valid?
    @user.cpf = "9" * 11
    assert @user.valid?
  end
end
