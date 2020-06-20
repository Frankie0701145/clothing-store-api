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
class SubType < ApplicationRecord
    validates :name, presence: true
    validates :value, presence: true
    has_and_belongs_to_many :types
    belongs_to :product
end
