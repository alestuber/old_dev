class Price < ActiveRecord::Base
  has_paper_trail

  belongs_to :priceable, polymorphic: true

  validates :value, numericality: { greater_than_or_equal_to: 0 }
end
