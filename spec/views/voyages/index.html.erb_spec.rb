require 'rails_helper'

RSpec.describe "voyages/index", type: :view do
  before(:each) do
    assign(:voyages, [
      Voyage.create!(
        :title => "Title",
        :cover => "Cover",
        :description => "Description",
        :user => nil
      ),
      Voyage.create!(
        :title => "Title",
        :cover => "Cover",
        :description => "Description",
        :user => nil
      )
    ])
  end

  it "renders a list of voyages" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Cover".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
