class Supplier < ActiveRecord::Base
  acts_as_paranoid

  has_many :variants
  validates :name, presence: true
end
