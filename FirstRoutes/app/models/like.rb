class Like < ApplicationRecord
  validates :likeable_id, :likeable_type, :user_id, presence: true

  belongs_to :likeable,
    polymorphic: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :user_id
end
