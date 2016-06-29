class DeleteSwiftypeDocumentJob < ActiveJob::Base
  queue_as :default

  def perform(*args) #This probably doesn't need to be *args? 
    # Remove documents from index
    DeleteSwiftypeDocuments.new(post).run
  end
end
