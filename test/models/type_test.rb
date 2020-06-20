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
  def setup 
    @type = Type.new quantity: 5, price: 100.00
  end
  test "quantity should be present" do
    @type.quantity = nil;
    assert_not @type.valid?
  end

  test "price should be present" do
    @type.price = nil;
    assert_not @type.valid?
  end
end
