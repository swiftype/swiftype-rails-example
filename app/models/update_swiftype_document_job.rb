class UpdateSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    post = Post.find(post_id)
    engine = Swiftype::Engine.find(ENV['SWIFTYPE_ENGINE_SLUG'])
    type = engine.document_type(Post.model_name.downcase)
    type.update_document(:external_id => post.id,
                         :fields => {:title => post.title,
                                     :body => post.body})
  end
end
