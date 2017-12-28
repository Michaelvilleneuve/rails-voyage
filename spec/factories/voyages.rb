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

FactoryBot.define do
  factory :voyage do
    title "MyString"
    cover "MyString"
    description "MyString"
    user nil
  end
end
