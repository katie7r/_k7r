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

require 'test_helper'

class TidbitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
