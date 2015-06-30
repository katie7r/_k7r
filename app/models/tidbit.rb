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
  TYPES = ['programming', 'zoology']

  belongs_to :author, class_name: 'Admin'

  validates :tidbit_type, inclusion: TYPES
  # validates :content, length: (less than something)
  # validates :author_id, :title, presence: true

  # =============== #
  # Type            #
  # =============== #

  def self.programming
    where(type: 'programming')
  end

  def self.zoology
    where(type: 'zoology')
  end

  # =============== #
  # More Info       #
  # =============== #

  def linked?
    more_info_link.present?
  end

end
