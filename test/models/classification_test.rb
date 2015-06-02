require 'test_helper'

class ClassificationTest < ActiveSupport::TestCase
  test 'cannot link the same category to the same product more than once' do
    product = products(:product_cereal_bar_apple_pda)
    category = Category.create name: 'New Category', taxonomy: taxonomies(:taxonomy_miscelaneous)

    assert_nothing_raised do
      product.categories << category
    end

    assert_raises (ActiveRecord::RecordInvalid) do
      product.categories << category
    end
  end
end
