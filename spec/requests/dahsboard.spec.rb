require 'rails_helper.rb'
 
feature 'Dashboard' do
  scenario 'can\'t view dashboard if disconnected' do
    visit '/dashboard'
    expect(page.current_path).to eq(new_user_session_path)
  end

  scenario 'can view dashboard if connected' do
    login_as(FactoryBot.create(:user, email: 'test@email.com', password: 'password'))
    visit '/dashboard'
    expect(page.current_path).to eq('/dashboard')
  end
end