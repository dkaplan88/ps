class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :posts

  validates_presence_of :name

  validates :name, uniqueness: true
end
