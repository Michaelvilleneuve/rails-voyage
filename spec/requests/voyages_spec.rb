require 'rails_helper'
 
feature 'Voyages' do
  scenario 'can view voyages list' do
    login_as(FactoryBot.create(:user, email: 'test@email.com', password: 'password'))
    visit '/voyages'
    expect(page).to have_content('Voyages')
  end
end