require 'rails_helper'

RSpec.describe "voyages/edit", type: :view do
  before(:each) do
    @voyage = assign(:voyage, Voyage.create!(
      :title => "MyString",
      :cover => File.new(Rails.root + 'spec/fixtures/photos/example.jpg'),
      :description => "MyString",
      :user => FactoryBot.create(:user)
    ))
  end

  it "renders the edit voyage form" do
    render

    assert_select "form[action=?][method=?]", voyage_path(@voyage), "post" do

      assert_select "input[name=?]", "voyage[title]"

      assert_select "input[name=?]", "voyage[cover]"

      assert_select "input[name=?]", "voyage[description]"

      assert_select "input[name=?]", "voyage[user_id]"
    end
  end
end
