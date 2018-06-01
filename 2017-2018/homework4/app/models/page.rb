class Page < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { :medium => "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
