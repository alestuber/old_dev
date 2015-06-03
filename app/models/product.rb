# PRODUCTS
# Products represent an entity for sale.
# Products can have variations, called variants
# Products properties include description, permalink, availability, etc. that do not change by variant.
#
# MASTER VARIANT
# Every product has one master variant, which stores master price and sku, size and weight, etc.
# The master variant does not have option values associated with it.
# Price, SKU, size, weight, etc. are all delegated to the master variant.
#
# VARIANTS
# All variants can access the product properties directly (via reverse delegation).
# All other variants have option values.

class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :history

  acts_as_paranoid

  belongs_to :supplier
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

  delegate :sku, to: :master

  has_many :classifications, dependent: :delete_all, inverse_of: :product
  has_many :categories, through: :classifications

  validates :name, presence: true
  validates :meta_keywords, length: { maximum: 255 }
  validates :meta_title, length: { maximum: 255 }

  # Master variant may be deleted (i.e. when the product is deleted)
  # which would make AR's default finder return nil.
  # This is a stopgap for that little problem.
  def master
    super || variants_including_master.with_deleted.where(is_master: true).first
  end

  private

  # Try building a slug based on the following fields in increasing order of specificity.
  def slug_candidates
    [
      :name,
      [:name, :sku]
    ]
  end
end
