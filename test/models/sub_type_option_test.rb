# == Schema Information
#
# Table name: sub_type_options
#
#  id         :integer          not null, primary key
#  option     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SubTypeOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
    @sub_type_option = SubTypeOption.new( option: "S")
  end

  test "option should be present" do
    @sub_type_option.option = "  "
    assert_not @sub_type_option.valid?
  end

  test "option should be unique" do 
    duplicate_sub_type_option = @sub_type_option.dup
    @sub_type_option.save
    assert_not duplicate_sub_type_option.valid?
  end

  test "option should be unique while disregarding option" do
    duplicate_sub_type_option = @sub_type_option.dup
    duplicate_sub_type_option.option.downcase!
    @sub_type_option.save
    assert_not duplicate_sub_type_option.valid?
  end

end
