class Variant < ActiveRecord::Base
  mount_uploaders :images, ImageUploader
  acts_as_paranoid

  has_one :price, as: :priceable

  belongs_to :product, touch: true, class_name: 'Product', inverse_of: :variants
  has_and_belongs_to_many :option_values

  delegate :name, :description, to: :product

  def name_and_sku
    "#{name} - #{sku}"
  end
end
