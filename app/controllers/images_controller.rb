class ImagesController < ApplicationController
	require 'rubygems'
	require 'rmagick'
	skip_before_action :login_required

	def create
		puts "==============================="
		cards = Card.where(user_id: get_current_user.name)
		card1 = cards[0]
		text1 = card1.title
		img = Magick::ImageList.new("app/assets/images/likeit.png")
		scaled_img = img.scale(600, 314)

		font = "app/assets/fonts/Makinas-4-Square.otf"
		draw = Magick::Draw.new
		draw.annotate(scaled_img, 0, 0, 50, 115, text1) do
		  self.font      = font
		  self.stroke    = 'transparent'
		  self.pointsize = 80
		  self.gravity   = Magick::NorthWestGravity
		end
		name = get_current_user.name
		scaled_img.write("public/images/#{name}.png") # save
		redirect_to "/"
	end

	def show
		@image_name = params[:id]
	end

end
