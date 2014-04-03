class DeleteSwiftypeDocumentJob < Struct.new(:post_id)
  def perform
    client = Swiftype::Client.new
    client.destroy_document(ENV['SWIFTYPE_ENGINE_SLUG'], Post.model_name.name.downcase, post_id)
  end
end
