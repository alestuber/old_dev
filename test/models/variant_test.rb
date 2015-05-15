require 'test_helper'

class VariantTest < ActiveSupport::TestCase

  def setup
    @variant = variants(:variant_cerealbar)
  end

  def tear_down
    @variant = nil
  end

  test "should validate price is greater than 0" do
    @variant.price = -1
    assert_not @variant.valid?
  end

  test "should validate price is 0" do
    @variant.price = 0
    assert @variant.valid?
  end
end
