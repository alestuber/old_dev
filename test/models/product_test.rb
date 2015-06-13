require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @cereal_bar = products(:product_cereal_bar_banana)
    @root_category = Category.create name: 'Root Category'
    @child_category = Category.create name: 'Cereals and stuff'
    @child_category.move_to_child_of @root_category
    @child_category.reload
  end

  test 'should all products be valid' do
    Product.all.each do |p|
      assert p.valid?
    end
  end

  test 'should belong to a category' do
    @cereal_bar.category = @child_category
    assert_equal @root_category, @cereal_bar.category.root
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
    assert_equal variants(:variant_apple_gala_extra_master, :variant_apple_gala_extra), apple_extra.variants_including_master
  end

  test 'HABTM option_types' do
    banana = products(:product_banana_prata_pda)
    assert_equal option_types(:ot_banana_personalization, :ot_banana_personalization2), banana.option_types
  end
end
