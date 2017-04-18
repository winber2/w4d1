class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }
  validates :title, :artist_id, :image_url, presence: true

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    class_name: :Comment,
    foreign_key: :artwork_id,
    dependent: :destroy

  has_many :likes,
    as: :likeable,
    dependent: :destroy
end
