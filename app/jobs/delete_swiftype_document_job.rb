class DeleteSwiftypeDocumentJob < ActiveJob::Base
  queue_as :default

  def perform(post_id)
    # Remove documents from index
    DeleteSwiftypeDocument.new(post_id).run
  end
end
