class Comment < ActiveRecord::Base
  include TextValidation

  belongs_to :article

  attr_accessible :body

  validates_presence_of :article_id
end
