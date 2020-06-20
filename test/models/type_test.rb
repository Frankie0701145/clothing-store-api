# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  price      :decimal(5, 2)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class TypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
