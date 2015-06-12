class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :permalink, slug_column: :permalink, use: :slugged
  before_create :set_permalink

  acts_as_nested_set dependent: :destroy

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

end
