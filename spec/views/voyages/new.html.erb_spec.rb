require 'rails_helper'

RSpec.describe "voyages/new", type: :view do
  before(:each) do
    assign(:voyage, Voyage.new(
      :title => "MyString",
      :cover => File.new(Rails.root + 'spec/fixtures/photos/example.jpg'),
      :description => "MyString",
      :user => nil
    ))
  end

  it "renders new voyage form" do
    render

    assert_select "form[action=?][method=?]", voyages_path, "post" do

      assert_select "input[name=?]", "voyage[title]"

      assert_select "input[name=?]", "voyage[cover]"

      assert_select "input[name=?]", "voyage[description]"

      assert_select "input[name=?]", "voyage[user_id]"
    end
  end
end
