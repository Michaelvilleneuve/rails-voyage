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

require 'rails_helper'

RSpec.describe Voyage, type: :model do
  let(:valid_attributes) { { title: 'lol', user: FactoryBot.create(:user) } }

  it "accepts valid voyage" do
    voyage = Voyage.new valid_attributes
    expect(voyage.save!).to be true
  end

  it "requires a valid title" do
    voyage = Voyage.new valid_attributes
    voyage.title = 'Lo'
    expect(voyage.valid?).to be false
    voyage.title = 'LoL'
    expect(voyage.valid?).to be true
  end
end
