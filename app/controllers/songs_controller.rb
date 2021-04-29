class SongsController < ApplicationController
    def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

	def create
		binding.pry
		# artist = Artist.find_or_create_by(name: (name: params[:song][:artist])
		# genre = Genre.find_or_create_by(name: params[:song][:genre])
		@song = Song.new(params.require(:song).permit(:name))
		@song.artist = Artist.find_or_create_by(name: params[:song][:artist])
		@song.genre = Genre.find_or_create_by(name: params[:song][:genre])
		@song.save
		redirect_to song_path(@song)
	end
	
	def update
		@song = Song.find(params[:id])
		@song.update(params.require(:song).permit(:name))
		redirect_to song_path(@song)
	end

	def edit
	  @song = Song.find(params[:id])
	end

end
