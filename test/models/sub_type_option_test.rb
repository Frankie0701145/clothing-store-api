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
    @subTypeOption = SubTypeOption.new( option: "S")
  end

  test "option should be present" do
    @subTypeOption.option = "  "
    assert_not @subTypeOption.valid?
  end

end
