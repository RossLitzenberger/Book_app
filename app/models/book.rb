class Book < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :cover, styles: { medium: "200x250#", thumbnail: "50x50#" }, default_url: "/images/medium/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates_presence_of :book_name, :author, :description ,:illustator, :cover, :user_id
  validates_length_of :book_name, :author, :within => 10..74
  validates_length_of :illustator, :within => 3..74, :allow_blank => true
  validates_length_of :description, :minimum => 200, :allow_blank => false
end
