# == Schema Information
#
# Table name: sub_types
#
#  id         :integer          not null, primary key
#  name       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#
# Indexes
#
#  index_sub_types_on_name        (name)
#  index_sub_types_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
require 'test_helper'

class SubTypeTest < ActiveSupport::TestCase

  def setup
    @sub_type = SubType.new(name: "Size", value: "M")
  end

  test "name should be present" do
    @sub_type.name = "  "
    assert_not @sub_type.valid?, "Name has to be presence"
  end

  # test "name should be unique" do
  #   duplicate_sub_type  = @sub_type.dup
  #   @sub_type.save
  #   assert_not duplicate_sub_type.valid?, "Name has already been taken"
  # end

  # test "name should be unique while disregarding case" do
  #   @sub_type.name = "Color"
  #   duplicate_sub_type  = @sub_type.dup
  #   duplicate_sub_type.name  = duplicate_sub_type.name.upcase
  #   @sub_type.save
  #   assert_not duplicate_sub_type.valid?, "Name has already been taken"
  # end

  test "value should be present" do
    @sub_type.value = "  "
    assert_not @sub_type.valid?, "Value has to be present"
  end

end
