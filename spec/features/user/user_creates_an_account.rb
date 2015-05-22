feature 'User creates a foobar' do
  scenario 'they see the foobar on the page' do
    visit new_user_registration_path

    fill_in 'user_name', with: 'Cameroni Kidmano'
    fill_in 'user_email', with: 'capy@bara.com'
    fill_in 'user_password', with: 'asdfasdf'
    fill_in 'user_password_confirmation', with: 'asdfasdf'
    click_button 'Create User!'

    expect(page).to have_css '#flash_notice', 'Welcome! You have signed up successfully.'
  end
end