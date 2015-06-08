class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :permalink, slug_column: :permalink, use: :slugged
  before_create :set_permalink

  belongs_to :taxonomy, class_name: 'Taxonomy', inverse_of: :categories

  has_many :classifications, -> { order(:position) }, dependent: :delete_all, inverse_of: :category
  has_many :products, through: :classifications

  acts_as_nested_set dependent: :destroy

  after_save :touch_ancestors_and_taxonomy
  after_touch :touch_ancestors_and_taxonomy

  validates :name, presence: true
  validates :meta_keywords, length: { maximum: 255 }
  validates :meta_description, length: { maximum: 255 }
  validates :meta_title, length: { maximum: 255 }

  # Creates permalink base for friendly_id
  def set_permalink
    if parent.present?
      self.permalink = [parent.permalink, (permalink.blank? ? name.parameterize : permalink.split('/').last)].join('/')
    else
      self.permalink = name.parameterize if permalink.blank?
    end
  end

  private

  def touch_ancestors_and_taxonomy
    # Touches all ancestors at once to avoid recursive taxonomy touch, and reduce queries.
    self.class.where(id: ancestors.pluck(:id)).update_all(updated_at: Time.now)
    # Have taxonomy touch happen in #touch_ancestors_and_taxonomy rather than association option in order
    #  for imports to override.
    taxonomy.try!(:touch)
  end
end
