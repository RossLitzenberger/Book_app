class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :book
  belongs_to :user

  validates_presence_of :content, :user_id, :book_id
  validates_length_of :content, :within => 10..150
end
