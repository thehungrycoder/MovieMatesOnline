Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '98K9vZt7RegvRYesrpR4A', 'LHHjlEjEQkQBJcbDPQDU1S6hBNXivPQqAKDIf0e5VU0'
  #provider :facebook, '209835929027784', '5c2e832147b71d979bfc20f0fe46c27f'
end