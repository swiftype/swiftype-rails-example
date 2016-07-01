class CreateOrUpdateSwiftypeDocument
  attr_reader :post
  
  def initialize(post)
    @post = post
  end
  
  def run  
    url = Rails.application.routes.url_helpers.post_url(post)
    client = Swiftype::Client.new
    client.create_or_update_document(ENV['SWIFTYPE_ENGINE_SLUG'],
                                     post.model_name.singular, #This assumes that the your engine uses "post" as a document type. You can replace it with any document type defined in your engine
                                     {:external_id => post.id,
                                       :fields => [{:name => 'title', :value => post.title, :type => 'string'},
                                                   {:name => 'body', :value => post.body, :type => 'text'},
                                                   {:name => 'url', :value => url, :type => 'enum'},
                                                   {:name => 'created_at', :value => post.created_at.iso8601, :type => 'date'}]})
  end
end
