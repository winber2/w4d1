class Comment < ApplicationRecord
  validates :user_id, :artwork_id, :body, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id

  belongs_to :artwork

  has_many :likes,
    as: :likeable,
    dependent: :destroy
end
