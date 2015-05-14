require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
  test 'supplier count' do
    assert_equal 33, Supplier.count
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
end
