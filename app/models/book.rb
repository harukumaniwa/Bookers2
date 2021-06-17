class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: {in: 2..200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
