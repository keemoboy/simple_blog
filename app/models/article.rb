class Article < ActiveRecord::Base
  include TextValidation

  has_many :comments, dependent: :destroy

  attr_accessible :body, :title

  validates_presence_of :title, :body 
  validates :body, :length => { :maximum => 250 }
end
