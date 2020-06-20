# == Schema Information
#
# Table name: sub_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sub_types_on_name  (name)
#
require 'test_helper'

class SubTypeTest < ActiveSupport::TestCase

  def setup
    @sub_type = SubType.new name: "Size"
  end

  test "name should be present" do
    @sub_type.name = "  "
    assert_not @sub_type.save
  end

  test "name should be unique" do
    duplicate_sub_type  = @sub_type.dup
    @sub_type.save
    assert_not duplicate_sub_type.valid?
  end
end
