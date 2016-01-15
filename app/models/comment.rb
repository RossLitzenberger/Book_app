class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :book
  belongs_to :user
end
