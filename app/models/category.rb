class Category < ActiveRecord::Base

  acts_as_nested_set dependent: :destroy

  validates :name, presence: true

end
