require 'rails_helper'

RSpec.describe "voyages/show", type: :view do
  before(:each) do
    @voyage = assign(:voyage, Voyage.create!(
      :title => "Title",
      :cover =>  File.new(Rails.root + 'spec/fixtures/photos/example.jpg'),
      :description => "Description",
      :user => FactoryBot.create(:user)
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Cover/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
