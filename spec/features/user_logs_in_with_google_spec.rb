require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    stub_google_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    expect(page).to have_content("John")
    expect(page).to have_link("Log Out")
  end

  # scenario "using facebook" do
  #   stub_facebook_omniauth
  #   visit root_path
  #   expect(page).to have_link("Sign in with Facebook")
  #   click_link "Sign in with Facebook"
  #   expect(page).to have_content("John")
  #   expect(page).to have_link("Log Out")
  # end
  #
  # def stub_google_omniauth
  #   OmniAuth.config.test_mode = true
  #   OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
  #     provider: "facebook",
  #     uid: "1234567590",
  #     info: {
  #       email: "my.email@gmail.com",
  #       first_name: "John",
  #       last_name: "Doe"
  #     },
  #     credentials: {
  #       token: "abcdefg132456789",
  #       refresh_token: "123456789abcdefg",
  #       expires_at: DateTime.now
  #     }
  #   })
  # end

  def stub_google_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: "google_oauth2",
      uid: "1234567590",
      info: {
        email: "my.email@gmail.com",
        first_name: "John",
        last_name: "Doe"
      },
      credentials: {
        token: "abcdefg132456789",
        refresh_token: "123456789abcdefg",
        expires_at: DateTime.now
      }
    })
  end
end
