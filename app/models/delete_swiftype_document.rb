class DeleteSwiftypeDocument
attr_reader :post_id

  def initialize(post_id)
    @post_id = post_id
  end

  def run
    client = Swiftype::Client.new
    client.destroy_document(ENV['SWIFTYPE_ENGINE_SLUG'], "post", post_id) #Post.model_name.downcase can be replaced with a document type from your engine.
  end
end