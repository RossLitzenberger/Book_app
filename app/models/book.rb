class Book < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_attached_file :cover, styles: { medium: "300x300#", thumbnail: "50x50#" }, default_url: "/images/thumbnail/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
