class Variant < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :supplier
end
