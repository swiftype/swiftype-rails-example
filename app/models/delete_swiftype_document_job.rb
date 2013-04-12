class DeleteSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    client = Swiftype::Easy.new
    client.destroy_document(ENV['SWIFTYPE_ENGINE_SLUG'], Post.model_name.downcase, post_id)
  end
end
