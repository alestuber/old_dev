require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test "should all suppliers be valid" do
    Supplier.all.each do |p|
      assert p.valid?
    end
  end

  test 'supplier count' do
    assert_equal 34, Supplier.count
  end

  test 'invalid without name' do
    supplier = Supplier.new
    assert_not supplier.valid?
  end

  test 'should have name' do
    supplier = suppliers(:supplier_extra)
    assert supplier.valid?
  end

  test 'mercado fresh supplier' do
    supplier = suppliers(:supplier_mercado_fresh)
    assert_equal 'Mercado Fresh', supplier.name
  end

  test 'products from a supplier' do
    supplier = suppliers(:supplier_mercado_natural)
    assert_equal [products(:product_choco_soy_break_mercado_natural)],
                  supplier.products, "Mercado natural should only have one product: choco_soy"
  end
end
