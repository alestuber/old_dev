require 'test_helper'

class UserHelperTest < ActionView::TestCase

  test "cpf formatter" do
    assert_equal "359.847.288-91", cpf_formatter(users(:alex).cpf)
  end

  test "date_of_birth formatter" do
    assert_equal users(:alex).date_of_birth.strftime("%d/%m/%Y"), date_formatter(users(:alex).date_of_birth)
  end

end
