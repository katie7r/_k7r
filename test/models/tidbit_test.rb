# == Schema Information
#
# Table name: tidbits
#
#  id         :integer          not null, primary key
#  type       :string(255)      not null
#  title      :string(255)      not null
#  content    :text             not null
#  more_info  :string(255)
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class TidbitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
