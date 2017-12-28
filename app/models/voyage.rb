# == Schema Information
#
# Table name: voyages
#
#  id          :integer          not null, primary key
#  title       :string
#  cover       :string
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Voyage < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :user
  validates :title, length: { minimum: 3, maximum: 300}
end
