require 'test_helper'

class OptionValueTest < ActiveSupport::TestCase
  def setup
    @value1 = option_values(:ov_banana_1)
    @value2 = option_values(:ov_banana_2)
    @value3 = option_values(:ov_banana_3)
  end

  test 'should all option_values be valid' do
    OptionValue.all.each do |value|
      assert value.valid?
    end
  end

  [:name, :presentation].each do |attrib|
    test "#{attrib} should be present" do
      @value1[attrib] = '    '
      assert_not @value1.valid?
      @value2[attrib] = nil
      assert_not @value2.valid?
    end
  end

  test 'name should be unique on the same option_type_id scope' do
    @value1.name = @value2.name
    assert_not @value1.valid?
  end

  test 'should belong to option_type' do
    assert_equal option_types(:ot_banana_personalization), @value1.option_type
    assert_equal option_types(:ot_banana_personalization), @value2.option_type
    assert_equal option_types(:ot_banana_personalization), @value3.option_type
  end

  test 'HABTM variants' do
    assert_equal [variants(:variant_banana_prata_pda_2kg)], @value1.variants
  end
end
