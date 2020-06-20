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
class SubType < ApplicationRecord
end