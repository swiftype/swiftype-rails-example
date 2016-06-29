class DeleteSwiftypeDocuments
attr_reader :post

    def initialize(post)
        @post = post
    end
    
    def run
        client = Swiftype::Client.new
        client.destroy_document(ENV['SWIFTYPE_ENGINE_SLUG'], Post.model_name.downcase, post.id) #Post.model_name.downcase can be replaced with a document type from your engine.
    end
end