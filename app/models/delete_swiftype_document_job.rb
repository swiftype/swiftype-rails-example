class DeleteSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    engine = Swiftype::Engine.find(ENV['SWIFTYPE_ENGINE_SLUG'])
    type = engine.document_type(Post.model_name.downcase)
    type.destroy_document(post_id)
  end
end
