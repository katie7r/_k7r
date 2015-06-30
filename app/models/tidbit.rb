# == Schema Information
#
# Table name: tidbits
#
#  id             :integer          not null, primary key
#  type           :string(255)      not null
#  title          :string(255)      not null
#  content        :text             not null
#  more_info      :string(255)
#  author_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  more_info_link :string(255)
#

class Tidbit < ActiveRecord::Base
  TIDBIT_TYPES = ['programming', 'zoology']

  belongs_to :author, class_name: 'Admin'

  validates :type, inclusion: TIDBIT_TYPES
  # validates :content, length: (less than something)
  # validates :author_id, :title, presence: true

  # =============== #
  # Type            #
  # =============== #

  def self.types
    TIDBIT_TYPES
  end

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
