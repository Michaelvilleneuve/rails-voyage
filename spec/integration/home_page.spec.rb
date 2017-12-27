require 'rails_helper.rb'
 
feature 'Homepage' do
  scenario 'can view homepage' do
    visit '/'
    expect(page).to have_content('Voyages')
  end
end