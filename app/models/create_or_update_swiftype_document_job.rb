class CreateOrUpdateSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    post = Post.find(post_id)
    url = Rails.application.routes.url_helpers.post_url(post)
    client = Swiftype::Client.new
    client.create_or_update_document(ENV['SWIFTYPE_ENGINE_SLUG'],
                                     Post.model_name.downcase,
                                     {:external_id => post.id,
                                       :fields => [{:name => 'title', :value => post.title, :type => 'string'},
                                                   {:name => 'body', :value => post.body, :type => 'text'},
                                                   {:name => 'url', :value => url, :type => 'enum'},
                                                   {:name => 'created_at', :value => post.created_at.iso8601, :type => 'date'}]})
  end
end
