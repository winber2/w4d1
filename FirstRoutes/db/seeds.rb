# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
user1 = User.create(username: "Flynn")
user2 = User.create(username: "Stevie")
user3 = User.create(username: "Bliff")

Artwork.destroy_all
artwork1 = Artwork.create(artist_id: user1.id, title: "magestic leaf", image_url: "magleaf.art")
artwork2 = Artwork.create(artist_id: user1.id, title: "sick bear", image_url: "sendtissues.art")
artwork3 = Artwork.create(artist_id: user2.id, title: "cool truck", image_url: "cool.truck.art")

ArtworkShare.destroy_all
artshare1 = ArtworkShare.create(viewer_id: user2.id, artwork_id: artwork1.id)
artshare2 = ArtworkShare.create(viewer_id: user3.id, artwork_id: artwork1.id)
artshare3 = ArtworkShare.create(viewer_id: user3.id, artwork_id: artwork3.id)

Comment.destroy_all
comment1 = Comment.create(user_id: user3.id, artwork_id: artwork3.id, body: 'wow, thats a really cool truck')
comment2 = Comment.create(user_id: user3.id, artwork_id: artwork2.id, body: 'this makes me really sad')
comment3 = Comment.create(user_id: user2.id, artwork_id: artwork1.id, body: 'MAJESTIC AF')

Like.destroy_all
like1 = Like.create(likeable_type: 'Artwork', likeable_id: artwork3.id, user_id: user3.id)
like2 = Like.create(likeable_type: 'Comment', likeable_id: comment2.id, user_id: user1.id)
like3 = Like.create(likeable_type: 'Comment', likeable_id: comment3.id, user_id: user2.id)
like4 = Like.create(likeable_type: 'Artwork', likeable_id: artwork1.id, user_id: user1.id)
