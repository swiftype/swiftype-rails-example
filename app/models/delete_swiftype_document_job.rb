class DeleteSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    engine = Swiftype::Engine.find('my-awesome-blog')
    type = engine.document_type('post')
    type.destroy_document(post_id)
  end
end
