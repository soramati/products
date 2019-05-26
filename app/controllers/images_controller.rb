class ImagesController < ApplicationController
	require 'rubygems'
	require 'rmagick' # require してライブラリを読み込み


	def create
		img = Magick::ImageList.new("app/assets/images/likeit.png")
		scaled_img = img.scale(600, 314)

		draw = Magick::Draw.new
		draw.annotate(scaled_img, 0, 0, 130, 150, 'HELLO WORLD!!') do
		  self.stroke    = 'transparent'
		  self.pointsize = 40
		  self.gravity   = Magick::NorthWestGravity
		end

		scaled_img.write("app/assets/images/mojilikeit.png") # save to file
		redirect_to "/"
	end
end
