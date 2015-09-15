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

require 'test_helper'

class LaughTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
