class Taxonomy < ActiveRecord::Base
  acts_as_list
  validates :name, presence: true

  has_many :categories
  has_one :root, -> { where parent_id: nil }, class_name: 'Category', dependent: :destroy

  after_create :set_root
  after_save :set_root_category_name

  default_scope { order("#{table_name}.position, #{table_name}.created_at") }

  private

  def set_root
    self.root ||= Category.create!(taxonomy_id: id, name: name)
  end

  def set_root_category_name
    root.update_attributes(name: name)
  end
end
