require 'test_helper'

class OptionTypeTest < ActiveSupport::TestCase
  def setup
    @type = option_types(:ot_banana_personalization)
    @other_type = option_types(:ot_banana_personalization2)
  end

  test 'should all option_types be valid' do
    OptionType.all.each do |type|
      assert type.valid?
    end
  end

  [:name, :presentation].each do |attrib|
    test "#{attrib} should be present" do
      @type[attrib] = '    '
      assert_not @type.valid?
      @type[attrib] = nil
      assert_not @type.valid?
    end
  end

  test 'name should be unique' do
    @other_type.name = @type.name
    assert_not @other_type.valid?
  end

  test 'HABTM products' do
    assert_equal [products(:product_banana_prata_pda)], @type.products
    assert_equal [products(:product_banana_prata_pda)], @other_type.products
  end

  test 'should has many option_values' do
    assert_equal option_values(:ov_banana_1, :ov_banana_2, :ov_banana_3), @type.option_values
  end
end
