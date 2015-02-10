class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :tags

  validates_presence_of :title, :content

  validates :title, uniqueness: true
end
