require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @cereal_bar = products(:product_cereal_bar_banana)
  end

  def tear_down
    @cereal_bar = nil
  end

  test "should all products be valid" do
    Product.all.each do |p|
      assert p.valid?
    end
  end

  test "should have name" do
    assert @cereal_bar.valid?

    product = Product.new
    assert_not product.valid?
  end

  test "master variant" do
    assert_equal 'MFR-0001', @cereal_bar.master.sku
    # assert_equal 'PDA-0001', @apple.master.sku
  end
end
