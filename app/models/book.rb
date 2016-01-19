class Book < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :cover, styles: { medium: "200x250#", thumbnail: "50x50#" }, default_url: "/images/medium/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
