OmniAuth.config.logger = Rails.logger

class SafeFailureEndpoint < OmniAuth::FailureEndpoint
  def call
    redirect_to_failure
  end
end

OmniAuth.config.on_failure = SafeFailureEndpoint

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '941285567597-9v5v6b5hubi5eq5iriv32k1f97706kbk.apps.googleusercontent.com',
           'ns3XnZWksKz9fFIfCOPip-TU',
           {
               scope: 'email, profile',
               hd: 'andela.co'
           }
end
#TODO move shit into the .env file


# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
# end