class Category < ActiveRecord::Base
  belongs_to :taxonomy
  belongs_to :parent

  act_as_nested_set
end
