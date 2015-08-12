# == Schema Information
#
# Table name: tidbits
#
#  id             :integer          not null, primary key
#  title          :string(255)      not null
#  content        :text             not null
#  more_info      :string(255)
#  more_info_link :string(255)
#  admin_id       :integer
#  created_at     :datetime
#  updated_at     :datetime
#  category       :integer          default(0), not null
#  published      :boolean          default(FALSE)
#  published_at   :datetime
#  author_name    :string(255)      default("")
#

require 'test_helper'

class TidbitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
