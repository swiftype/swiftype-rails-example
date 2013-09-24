# for Heroku Addon
if ENV['SWIFTYPE_URL']
  Swiftype.authenticated_url = ENV['SWIFTYPE_URL']
else
  Swiftype.api_key = ENV['SWIFTYPE_API_KEY']
end
