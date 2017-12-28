require 'rails_helper'

RSpec.describe "Voyages", type: :request do
  describe "GET /voyages" do
    it "works! (now write some real specs)" do
      get voyages_path
      expect(response).to have_http_status(200)
    end
  end
end
