namespace :app do
  desc "create the 'post' document type"
  task :create_document_type => :environment do
    if ENV['SWIFTYPE_API_KEY'].blank?
      abort("SWIFTYPE_API_KEY not set")
    end

    if ENV['SWIFTYPE_ENGINE_SLUG'].blank?
      abort("SWIFTYPE_ENGINE_SLUG not set")
    end

    client = Swiftype::Client.new
    client.create_document_type(ENV['SWIFTYPE_ENGINE_SLUG'], Post.model_name.singular)
  end

  desc "index all posts"
  task :index_posts => :environment do
    if ENV['SWIFTYPE_API_KEY'].blank?
      abort("SWIFTYPE_API_KEY not set")
    end

    if ENV['SWIFTYPE_ENGINE_SLUG'].blank?
      abort("SWIFTYPE_ENGINE_SLUG not set")
    end

    client = Swiftype::Client.new

    Post.find_in_batches(:batch_size => 100) do |posts|
      documents = posts.map do |post|
        url = Rails.application.routes.url_helpers.post_url(post)
        {:external_id => post.id,
         :fields => [{:name => 'title', :value => post.title, :type => 'string'},
                     {:name => 'body', :value => post.body, :type => 'text'},
                     {:name => 'url', :value => url, :type => 'enum'},
                     {:name => 'created_at', :value => post.created_at.iso8601, :type => 'date'}]}
      end

      results = client.create_or_update_documents(ENV['SWIFTYPE_ENGINE_SLUG'], Post.model_name.singular, documents)

      results.each_with_index do |result, index|
        puts "Could not create #{posts[index].title} (##{posts[index].id})" if result == false
      end
    end
  end
end
