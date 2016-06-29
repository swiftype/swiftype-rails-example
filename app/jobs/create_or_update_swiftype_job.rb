class CreateOrUpdateSwiftypeJob < ActiveJob::Base
  queue_as :default

  def perform(*args) #This probably doesn't need to be *args?
    # Add documents to index
    CreateOrUpdateDocumentsSwiftype.new(post).run
  end
end
