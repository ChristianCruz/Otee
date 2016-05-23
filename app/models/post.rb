class Post < ActiveRecord::Base
  has_many :comments

  belongs_to :user
  belongs_to :category
  
  default_scope { order('created_at DESC') }

  validates :product, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  # validates :category, presence: true
  # validates :price, presence: true

  mount_uploader :image, ImageUploader

end
