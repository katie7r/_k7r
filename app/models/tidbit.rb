# == Schema Information
#
# Table name: tidbits
#
#  id             :integer          not null, primary key
#  tidbit_type    :string(255)      not null
#  title          :string(255)      not null
#  content        :text             not null
#  more_info      :string(255)
#  more_info_link :string(255)
#  author_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Tidbit < ActiveRecord::Base
  enum category: ['programming', 'zoology']

  belongs_to :author, class_name: 'Admin'

  validates :author_id, :category, :content, :title, presence: true
  # TODO: validates :content, length: (less than something)

  delegate :name, :shy_name, to: :author, prefix: true

  # Orders tidbits from most to least recently created
  def self.in_order
    order('created_at DESC')
  end

  # Gets tidbits with given category
  def self.with_category(category)
    where(category: self.categories[category])
  end

  # Gets the integer value for the tidbit's category, based on name
  def category_id
    self.class.categories[self.category]
  end

  # Returns whether the tidbit has a link for more info
  def linked?
    more_info_link.present?
  end

end
