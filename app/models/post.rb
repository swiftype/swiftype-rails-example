class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  after_save :create_swiftype_document
  after_destroy :destroy_swiftype_document

  private
  def create_swiftype_document
    CreateOrUpdateSwiftypeJob.perform_later(self)
  end
    
  def destroy_swiftype_document
    DeleteSwiftypeDocumentJob.perform_later(id)
  end
end
