class Post < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, :body, presence: true
  validates :user, presence: true
end
