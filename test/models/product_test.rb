# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  product_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_products_on_product_name  (product_name)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def setup
    @product = Product.new(product_name: "V-neck shirt")
  end

  test "product_name should be present" do
    @product.product_name = "  "
    assert_not @product.valid?
  end

  test "product_name should be unique" do
    duplicate_product = @product.dup
    @product.save
    assert_not duplicate_product.valid?
  end

  test "product_name should be unique while disregarding case" do
    duplicate_product = @product.dup
    duplicate_product.product_name = duplicate_product.product_name.upcase
    @product.save
    assert_not duplicate_product.valid?
  end

end