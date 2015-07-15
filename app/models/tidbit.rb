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
  # validates :content, length: (less than something)

  delegate :name, :shy_name, to: :author, prefix: true

  def self.in_order
    order('created_at DESC')
  end

  # =============== #
  # Category        #
  # =============== #

  def self.with_category(category)
    where(category: self.categories[category])
  end

  def category_id
    self.class.categories[self.category]
  end

  # =============== #
  # More Info       #
  # =============== #

  def linked?
    more_info_link.present?
  end

end
