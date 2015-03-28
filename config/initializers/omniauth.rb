OmniAuth.config.logger = Rails.logger
#
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, 'my Google client id', 'my Google client secret', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '941285567597-9v5v6b5hubi5eq5iriv32k1f97706kbk.apps.googleusercontent.com',
           'ns3XnZWksKz9fFIfCOPip-TU'
end


# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
# end