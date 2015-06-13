# PRODUCTS
# Products represent an entity for sale.
# Products can have variations, called variants
#
# MASTER VARIANT
# Every product has one master variant, which stores sku, size and weight, etc.
# The master variant does not have option values associated with it.
# SKU, size, weight, etc. are all delegated to the master variant.
#
# VARIANTS
# All variants can access the product properties directly (via reverse delegation).
# All other variants have option values.

class Product < ActiveRecord::Base

  has_and_belongs_to_many :option_types

  has_one :master,
          -> { where is_master: true },
          inverse_of: :product,
          class_name: 'Variant'

  has_many :variants,
           -> { where(is_master: false).order("#{::Variant.quoted_table_name}.position ASC") },
           inverse_of: :product,
           class_name: 'Variant'

  has_many :variants_including_master,
           -> { order("#{::Variant.quoted_table_name}.position ASC") },
           inverse_of: :product,
           class_name: 'Variant',
           dependent:  :destroy

  validates :name, presence: true

end
