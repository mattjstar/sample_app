include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

def sign_in(user)
	visit signin_path
	fill_in "Email",    with: user.email
  	fill_in "Password", with: user.password
  	click_button "Sign in"
  	# Sign in when not using Capybara 
  	# (the put requests in authentication_pages_spec).
  	# You can't have cookies in your test network (53:56 of video 9) so we 
  	# manually add them here:
  	cookies[:remember_token] = user.remember_token
end
