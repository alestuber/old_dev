class Category < ActiveRecord::Base
  belongs_to :taxonomy, class_name: 'Taxonomy', inverse_of: :categories
  has_many :products

  acts_as_nested_set dependent: :destroy

  after_save :touch_ancestors_and_taxonomy
  after_touch :touch_ancestors_and_taxonomy

  validates :name, presence: true

  private

  def touch_ancestors_and_taxonomy
    # Touches all ancestors at once to avoid recursive taxonomy touch, and reduce queries.
    self.class.where(id: ancestors.pluck(:id)).update_all(updated_at: Time.now)
    # Have taxonomy touch happen in #touch_ancestors_and_taxonomy rather than association option in order
    #  for imports to override.
    taxonomy.try!(:touch)
  end
end
