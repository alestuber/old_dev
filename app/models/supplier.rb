class Supplier < ActiveRecord::Base
  acts_as_paranoid

  has_many :products
  validates :name, presence: true
end
