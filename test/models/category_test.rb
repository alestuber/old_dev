require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
 def setup
   @parent = Category.create name: 'New Root Category', taxonomy: taxonomies(:taxonomy_miscelaneous)
   @child = Category.create name: 'New Child', taxonomy: taxonomies(:taxonomy_miscelaneous)
   @child.parent = @parent
 end

  test 'should all categories be valid' do
    Category.all.each do |category|
      assert category.valid?
    end
  end

 test 'should a new category have children' do
   assert @parent.valid?
   assert @child.valid?
   assert_equal @parent, @child.parent

   grandson = Category.create name: 'New Grandson', taxonomy: taxonomies(:taxonomy_miscelaneous)
   grandson.parent = @child

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
