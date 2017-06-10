class Post < ApplicationRecord
  has_many :comments
  validates :body, presence: true, length: {maximum: 200}
end
