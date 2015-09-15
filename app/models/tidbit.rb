# == Schema Information
#
# Table name: tidbits
#
#  id             :integer          not null, primary key
#  title          :string           not null
#  content        :text             not null
#  more_info      :text
#  more_info_link :string
#  author_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#  category       :integer          default(0), not null
#  published      :boolean          default(FALSE)
#

class Tidbit < ActiveRecord::Base
  enum category: ['programming', 'zoology', 'miscellaneous']

  belongs_to :author, class_name: 'Admin'

  validates :author_id, :category, :content, :title, presence: true
  validate  :content_length_cannot_be_greater_than_100_words,
            :title_length_cannot_be_greater_than_10_words

  delegate :name, :shy_name, to: :author, prefix: true

  before_validation :strip_whitespace

  #========================= Class Methods

  # Orders tidbits from most to least recently created
  def self.in_order
    order('created_at DESC')
  end

  # Returns the total count for each category (and all total)
  def self.get_totals
    totals = {}
    self.categories.each{ |name, value| totals[name] = Tidbit.with_category_id(value).size }
    totals['all'] = totals.values.inject(:+)
    return totals
  end

  # Gets tidbits with given category
  def self.with_category(category)
    with_category_id(self.categories[category])
  end

  # Gets tidbits with given category id
  def self.with_category_id(category_id)
    where(category: category_id)
  end

  # Gets published tidbits
  def self.published
    where(published: true)
  end

  # Gets unpublished tidbits
  def self.unpublished
    where(published: false)
  end

  #========================= Instance Methods

  # Gets the integer value for the tidbit's category, based on name
  def category_id
    self.class.categories[self.category]
  end

  # Returns whether the tidbit has text for more info
  def more_info?
    more_info.present?
  end

  # Returns whether the tidbit has a link for more info
  def linked?
    more_info_link.present?
  end

  private

  def content_length_cannot_be_greater_than_100_words # avoiding the "100 words or [less vs fewer]" issue
    if content.split(' ').size > 100
      errors.add(:content, 'cannot be longer than 100 words')
    end
  end

  def title_length_cannot_be_greater_than_10_words
    if title.split(' ').size > 10
      errors.add(:title, 'cannot be longer than 10 words')
    end
  end

  def strip_whitespace
    self.title          = self.title.strip
    self.content        = self.content.strip
    self.more_info_link = self.more_info_link.strip
    self.more_info      = self.more_info.strip
  end

end
