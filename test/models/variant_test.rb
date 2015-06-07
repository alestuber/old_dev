require 'test_helper'

class VariantTest < ActiveSupport::TestCase
  def setup
    @variant = variants(:variant_cereal_bar_banana_master)
    @variant2 = variants(:variant_banana_prata_pda_2kg)
  end

  def tear_down
    @variant = nil
  end

  test 'should all variants be valid' do
    Variant.all.each do |p|
      assert p.valid?
    end
  end

  test 'should have name and sku' do
    assert_equal 'Barra de Cereal Nutry Aveia, Banana e Mel - MFR-0001', @variant.name_and_sku
  end

  test 'if it is a master variant' do
    assert @variant.is_master?
    assert_equal @variant, @variant.product.master
  end

  test 'HABTM option values' do
    assert_equal [option_values(:ov_banana_1)], @variant2.option_values
  end
end
