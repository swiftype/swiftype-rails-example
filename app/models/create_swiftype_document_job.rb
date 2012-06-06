class CreateSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    post = Post.find(post_id)
    engine = Swiftype::Engine.find('my-awesome-blog')
    type = engine.document_type('post')
    type.create_document({:external_id => post.id,
                           :fields => [{:name => 'title', :value => post.title, :type => 'string'},
                                       {:name => 'body', :value => post.body, :type => 'text'},
                                       {:name => 'url', :value => Rails.application.routes.url_helpers.post_url(post, :host => "localhost:5000"), :type => 'enum'},
                                       {:name => 'created_at', :value => post.created_at.iso8601, :type => 'date'}]})
  end
end
