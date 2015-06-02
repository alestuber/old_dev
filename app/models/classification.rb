class Classification < ActiveRecord::Base
  self.table_name = 'categories_products'
  acts_as_list scope: :category
  belongs_to :product, class_name: 'Product', inverse_of: :classifications, touch: true
  belongs_to :category, class_name: 'Category', inverse_of: :classifications, touch: true

  validates_uniqueness_of :category_id, scope: :product_id, message: :already_linked
end
