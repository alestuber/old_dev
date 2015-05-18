require 'test_helper'

class VariantTest < ActiveSupport::TestCase

  def setup
    @variant = variants(:variant_cereal_bar_banana_master)
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

  test "should have name and sku" do
    assert_equal "Barra de Cereal Nutry Aveia, Banana e Mel - MFR-0001", @variant.name_and_sku
  end

  test "if it is a master variant" do
    assert @variant.is_master?
    assert_equal @variant, @variant.product.master
  end

end
