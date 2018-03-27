Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  # provider :facebook, ENV['APP_ID'], ENV['APP_SECRET'],
  # client_options: {
  #   site: 'https://graph.facebook.com/v3.0',
  #   authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
  # }   ---For api consumption
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']

  on_failure { |env| OmniauthCallbacksController.action(:failure).call(env) }
end
