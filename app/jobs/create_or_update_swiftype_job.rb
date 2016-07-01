class CreateOrUpdateSwiftypeJob < ActiveJob::Base
  queue_as :default

  def perform(post)
    # Add documents to index
    CreateOrUpdateSwiftypeDocument.new(post).run
  end
end
