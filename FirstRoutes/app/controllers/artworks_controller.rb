class ArtworksController < ApplicationController
  def index
    user = User.find(params[:user_id])
    viewing = user.shared_artworks
    artworks = user.artworks
    render json: { artworks: artworks, viewing: viewing }
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  rescue
    render text: 'Artwork not found', status: :not_found
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update(artwork_params)
    render json: artwork

  rescue
    if artwork
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    else
      render text: "artwork not found", status: :not_found
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  rescue
    render text: "artwork not found", status: :not_found

  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
