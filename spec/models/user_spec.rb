require "rails_helper"

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
    auth = {
      provider: "google",
      uid: "1234567890",
      info: {
        email: "user@email.com",
        first_name: "Jesse",
        last_name: "Spevack"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now
      }
    }
    test_user = User.create_or_update_from_omniauth(auth)
    expect(test_user.uid).to eq("1234567890")
    expect(test_user.email).to eq("user@email.com")
    expect(test_user.first_name).to eq("Jesse")
    expect(test_user.last_name).to eq("Spevack")
    test_user.delete
  end
end
