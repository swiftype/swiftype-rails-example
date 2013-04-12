class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  attr_accessible :title, :body

  after_save :enqueue_create_or_update_document_job
  after_destroy :enqueue_delete_document_job

  private

  def enqueue_create_or_update_document_job
    Delayed::Job.enqueue CreateOrUpdateSwiftypeDocumentJob.new(self.id)
  end

  def enqueue_delete_document_job
    Delayed::Job.enqueue DeleteSwiftypeDocumentJob.new(self.id)
  end
end
