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
class Type < ApplicationRecord
    validates :quantity, presence: true
    validates :price, presence: true 
end
