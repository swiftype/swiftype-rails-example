class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  after_save :create_swiftype_document
#  before_destroy :destroy_swiftype_document # This does not work. I have yet to figure out why.

  private
    
  def create_swiftype_document
      UpdateSwiftypeJob.perform_later(self)
  end
    
#  def destroy_swiftype_document
#      DestroySwiftypeJob.perform_now(self) # Does not work!
#  end  
end
