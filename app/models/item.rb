class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites

  acts_as_votable

  has_attached_file :image, default_url: 'sprout2.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
