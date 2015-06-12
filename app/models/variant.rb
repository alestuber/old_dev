class Variant < ActiveRecord::Base
  mount_uploaders :images, ImageUploader

  has_one :price, as: :priceable

  belongs_to :product, class_name: 'Product', inverse_of: :variants
  has_and_belongs_to_many :option_values

end
