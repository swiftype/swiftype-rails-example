Swiftype.configure do |config|
  config.api_key = ENV['SWIFTYPE_API_KEY']
  # for Heroku Addon
  config.endpoint = ENV['SWIFTYPE_API_ENDPOINT'] if ENV['SWIFTYPE_API_ENDPOINT'] 
end
