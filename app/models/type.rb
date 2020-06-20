# == Schema Information
#
# Table name: types
#
#  id         :integer          not null, primary key
#  price      :decimal(5, 2)
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#
# Indexes
#
#  index_types_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class Type < ApplicationRecord
    validates :quantity, presence: true
    validates :price, presence: true 
    belongs_to :product
end
