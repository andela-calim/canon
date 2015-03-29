OmniAuth.config.logger = Rails.logger

class SafeFailureEndpoint < OmniAuth::FailureEndpoint
  def call
    redirect_to_failure
  end
end

OmniAuth.config.on_failure = SafeFailureEndpoint

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_ID'],ENV['GOOGLE_SECRET'],
           {
               scope: 'email, profile',
               hd: 'andela.co',
               access_type: "offline",
               approval_prompt: ""
           }
end