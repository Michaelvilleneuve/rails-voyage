require 'rails_helper.rb'
 
feature 'Homepage' do
  scenario 'can view homepage' do
    visit '/'
    expect(page).to have_content('Voyages')
  end

  scenario 'can view form' do
    visit '/'
    expect(page).to have_css('section.home form')
  end
end