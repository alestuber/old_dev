class OptionType < ActiveRecord::Base
  has_and_belongs_to_many :products
  has_many :option_values, -> { order(:position) }, dependent: :destroy, inverse_of: :option_type

  validates :name, presence: true, uniqueness: true
  validates :presentation, presence: true
end
