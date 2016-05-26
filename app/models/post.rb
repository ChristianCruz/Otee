class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  belongs_to :user
  belongs_to :category
  
  default_scope { order('created_at DESC') }

  scope :searched, -> (keyword) { where('product LIKE ?', "%#{keyword}%")}

  validates :product, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 20 }, presence: true
  # validates :category, presence: true
  # validates :price, presence: true

  mount_uploader :image, ImageUploader

end
