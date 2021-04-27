class SongsController < ApplicationController
    def index
		@songs = Songs.all
	end

	def show
		@song = Songs.find(params[:id])
	end

	def new
		@song = Songs.new
	end

	def create
		@song = Songs.new(post_params(:name, :bio))
		@song.save
		redirect_to post_path(@song)
	  end
	  
	  def update
		@song = Songs.find(params[:id])
		@song.update(post_params(:name))
		redirect_to post_path(@song)
	  end

	def edit
	  @song = Songs.find(params[:id])
	end

end
