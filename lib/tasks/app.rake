namespace :app do
  desc "create the 'post' document type"
  task :create_document_type => :environment do
    if ENV['SWIFTYPE_API_KEY'].blank?
      abort("SWIFTYPE_API_KEY not set")
    end

    if ENV['SWIFTYPE_ENGINE_SLUG'].blank?
      abort("SWIFTYPE_ENGINE_SLUG not set")
    end

    engine = Swiftype::Engine.find(ENV['SWIFTYPE_ENGINE_SLUG'])
    engine.create_document_type(:name => Post.model_name.downcase)
  end
end
