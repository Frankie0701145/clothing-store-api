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
class Product < ApplicationRecord
    validates :product_name, presence: true, uniqueness: { case_sensitive: false }
end
