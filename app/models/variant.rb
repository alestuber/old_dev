class Variant < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :supplier
  validates :price, :numericality => { greater_than_or_equal_to: 0 }
end
