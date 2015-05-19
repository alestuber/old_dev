class Variant < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :supplier
  belongs_to :product, touch: true #, class_name: 'Product', inverse_of: :variants
  delegate :name, :description, to: :product

  validates :price, :numericality => { greater_than_or_equal_to: 0 }

  def name_and_sku
    "#{name} - #{sku}"
  end
end
