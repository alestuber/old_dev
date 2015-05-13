class Supplier < ActiveRecord::Base
#  act_as_paranoid

  has_many :products
end
