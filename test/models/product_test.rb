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
  end

  test "has many variants" do
    apple_extra = products(:product_apple_gala_extra)
    assert_equal [variants(:variant_apple_gala_extra)], apple_extra.variants
    assert_equal variants(:variant_apple_gala_extra_master, :variant_apple_gala_extra), apple_extra.variants_including_master
  end
end