class OptionValue < ActiveRecord::Base
  belongs_to :option_type, inverse_of: :option_values
  # has_and_belongs_to_many :variants, join_table: 'spree_option_values_variants'

  validates :name, presence: true, uniqueness: { scope: :option_type_id }
  validates :presentation, presence: true
end
