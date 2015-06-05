class Classification < ActiveRecord::Base
  acts_as_list scope: :category
  belongs_to :product, inverse_of: :classifications, touch: true
  belongs_to :category, inverse_of: :classifications, touch: true

  validates_uniqueness_of :category_id, scope: :product_id, message: :already_linked
end
