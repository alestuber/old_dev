require 'test_helper'

class TaxonomyTest < ActiveSupport::TestCase
  def setup
    @taxonomy = taxonomies(:taxonomy_categories)
    @root_category = categories(:root_category)
    @child_category = categories(:child_category)
  end

  test 'should all taxonomies be valid' do
    Taxonomy.all.each do |taxonomy|
      assert taxonomy.valid?
    end
  end

  test 'should a taxonomy with empty name be invalid' do
    empty_taxonomy = Taxonomy.new
    assert_not empty_taxonomy.valid?
  end

  test 'should the root category update name' do
    assert_equal 'Root Category', @taxonomy.root.name
    assert_equal 'Root Category', @taxonomy.name
    @taxonomy.name = 'Master Category'
    @taxonomy.save
    assert_equal 'Master Category', @taxonomy.root.name
  end

  test 'should destroy all associated categories' do
    assert_equal @taxonomy, @root_category.taxonomy
    assert_equal @taxonomy, @child_category.taxonomy

    @taxonomy.destroy!
    assert_raises (ActiveRecord::RecordNotFound) do
      Category.find @root_category.id
    end
    assert_raises (ActiveRecord::RecordNotFound) do
      Category.find @child_category.id
    end
  end
end
