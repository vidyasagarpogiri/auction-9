class Item < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates_format_of :email, :with => /@/, :message => 'must be a valid email'
  validates_presence_of :email, :contact_name, :retail_value, :delivery

  acts_as_votable

  has_attached_file :image, default_url: 'sprout2.jpg'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
