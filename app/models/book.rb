class Book < ActiveRecord::Base
  has_many :comments
  has_attached_file :cover, styles: { medium: "300x300", thumbnail: "50x50" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
end
