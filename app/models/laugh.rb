# == Schema Information
#
# Table name: laughs
#
#  id          :integer          not null, primary key
#  setup       :text             default("")
#  content     :text             not null
#  followup    :text             default("")
#  source_link :string           default("")
#  published   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Laugh < ActiveRecord::Base
  validates :content, presence: true

  before_validation :strip_whitespace

  #========================= Class Methods

  # Orders laughs from most to least recently created
  def self.in_order
    order('created_at DESC')
  end

  # Gets published laughs
  def self.published
    where(published: true)
  end

  # Gets unpublished laughs
  def self.unpublished
    where(published: false)
  end

  #========================= Instance Methods

  # Returns whether the laugh has a link for its source
  def linked?
    source_link.present?
  end

  private
    def strip_whitespace
      self.content     = self.content.strip
      self.followup    = self.followup.strip
      self.setup       = self.setup.strip
      self.source_link = self.source_link.strip
    end
end
