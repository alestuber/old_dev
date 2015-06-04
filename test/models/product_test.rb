require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @cereal_bar = products(:product_cereal_bar_banana)
  end

  def tear_down
    @cereal_bar = nil
  end

  test 'should all products be valid' do
    Product.all.each do |p|
      assert p.valid?
    end
  end

  test 'should have name' do
    assert @cereal_bar.valid?

    product = Product.new
    product.master = variants(:variant_apple_gala_extra)
    assert_not product.valid?
  end

  test 'master variant' do
    assert_equal 'MFR-0001', @cereal_bar.master.sku
  end

  test 'has many variants' do
    apple_extra = products(:product_apple_gala_extra)
    assert_equal [variants(:variant_apple_gala_extra)], apple_extra.variants
    assert_equal variants(:variant_apple_gala_extra_master, :variant_apple_gala_extra),
                 apple_extra.variants_including_master
  end

  test 'HABTM option_types' do
    banana = products(:product_banana_prata_pda)
    assert_equal option_types(:ot_banana_personalization, :ot_banana_personalization2), banana.option_types
  end

  test 'has many categories through classifications' do
    product_copo_coca_cola = products(:product_copo_coca_cola)
    assert_equal categories(:category_cozinha, :brand_coca_cola), product_copo_coca_cola.categories
  end

  test 'should delegate sku to master variant' do
    sku = @cereal_bar.master.sku
    assert_equal sku, @cereal_bar.sku
  end
end
