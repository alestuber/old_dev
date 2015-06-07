require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  def setup
    @price = Price.create value: 1.32
  end

  test 'should all prices be valid' do
    Price.all.each do |price|
      assert price.valid?
    end
  end

  test 'should validate price is greater than 0' do
    @price.value = -1
    assert_not @price.valid?
  end

  test 'should validate price is 0' do
    @price.value = 0
    assert @price.valid?
  end
end
