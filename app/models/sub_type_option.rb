# == Schema Information
#
# Table name: sub_type_options
#
#  id         :integer          not null, primary key
#  option     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SubTypeOption < ApplicationRecord
    validates :option, presence: true, uniqueness: {case_sensitive: false}
end
