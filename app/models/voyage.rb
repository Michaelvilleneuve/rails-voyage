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
  
  has_attached_file :cover, styles: { full: "1600x1200>", medium: "600x600>" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  validates_presence_of :title, :user
  validates :title, length: { minimum: 3, maximum: 300}
end
