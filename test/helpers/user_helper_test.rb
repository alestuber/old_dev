require 'test_helper'

class UserHelperTest < ActionView::TestCase
  test "cpf formatter" do
    assert_equal "359.847.288-91", cpf_formatter(users(:alex).cpf)
  end

  test "date_of_birth formatter" do
    assert_equal users(:alex).date_of_birth.strftime("%d/%m/%Y"), date_formatter(users(:alex).date_of_birth)
  end

  test "phone formatter for home phone" do
    assert_equal "5055-8354", phone_formatter("50558354")
  end

  test "phone formatter for cell phone" do
    assert_equal "95055-8354", phone_formatter("950558354")
  end

  test "phone formatter for home phone with two digits area code" do
    assert_equal "(11) 5055-8354", phone_formatter("1150558354")
  end

  test "phone formatter for cell phone with two digits area code" do
    assert_equal "(11) 95055-8354", phone_formatter("11950558354")
  end

  test "phone formatter for home phone with three digits area code" do
    assert_equal "(11) 5055-8354", phone_formatter("01150558354")
  end

  test "phone formatter for cell phone with three digits area code" do
    assert_equal "(11) 95055-8354", phone_formatter("011950558354")
  end

  test "phone formatter should return nil when it's out of range" do
    assert_nil phone_formatter("5558354")
    assert_nil phone_formatter("1011950558354")
  end
end
