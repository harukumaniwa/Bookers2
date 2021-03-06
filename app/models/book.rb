class Book < ApplicationRecord
  belongs_to :user, optional: true
  validates :title, presence: true
  validates :body, presence: true, length: {in: 2..200}
end
