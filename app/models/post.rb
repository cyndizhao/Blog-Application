class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  def formatted_date
    created_at.strftime('%A, %B %d, %Y')
  end
end
