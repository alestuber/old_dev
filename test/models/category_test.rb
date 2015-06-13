require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @parent = Category.create name: 'New Root Category'
    @child = Category.create name: 'New Child'
    @child.move_to_child_of @parent
    @child.reload
  end

  test 'should all categories be valid' do
    Category.all.each do |category|
      assert category.valid?
    end
  end

  test 'should have a product if its a leaf node' do
    assert @child.leaf?
    assert_not @child.root.leaf?
    assert_equal [], @child.products
    new_product = products(:product_cereal_bar_banana)
    new_product.category = @child
    new_product.save
    assert_equal [new_product], @child.reload.products
  end

  test 'should a new category have children' do
    assert_equal @parent, @child.parent

    grandson = Category.create name: 'New Grandson'
    grandson.move_to_child_of @child
    grandson.reload

    assert_equal @child, grandson.parent

    @parent.destroy
    assert_raises (ActiveRecord::RecordNotFound) do
      Category.find @parent.id
    end
    assert_raises (ActiveRecord::RecordNotFound) do
      Category.find @child.id
    end
    assert_raises (ActiveRecord::RecordNotFound) do
      Category.find grandson.id
    end
  end
end
