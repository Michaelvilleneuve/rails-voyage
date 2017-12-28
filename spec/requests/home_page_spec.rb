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

  scenario 'redirects if connected' do
    login_as(FactoryBot.create(:user, email: 'test@email.com', password: 'password'))
    visit '/'
    expect(page.current_path).not_to eq('/')
  end
end