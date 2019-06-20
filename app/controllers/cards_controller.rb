class CardsController < ApplicationController

  def index
  	@cards = Card.where(user_id: get_current_user.name)
  	@card = Card.new
  end

  def create
    Card.where(user_id: get_current_user.name).destroy_all
  	card = Card.new(card_params)
    card.user_id = get_current_user.name.to_i
  	card.save!
    createImage
    head :no_content
  end
  def update
    card = Card.find(params[:id])
    card.update(card_params)
    redirect_to "/"

  end
  def destroy
  	card = Card.find(params[:id])
  	card.destroy
  	redirect_to "/",notice: "リストを削除しました。"
  end

  def modal
    
  end
  def card_params
  	params.require(:card).permit(:title)
  end


  def createImage

    cards = Card.where(user_id: get_current_user.name)
    card1 = cards[0]
    text1 = card1.title
    img = Magick::ImageList.new("app/assets/images/likeit.jpg")
    scaled_img = img.scale(382 , 199)

    if text1.length < 4
      font_size = 60
    else
      font_size = 50
    end

        
    font = "app/assets/fonts/GenEiNuGothic-EB.ttf"
    draw = Magick::Draw.new
    draw.annotate(scaled_img, 0, 0, -6, 6, text1) do
      self.font      = font
      self.stroke    = 'transparent'
      self.pointsize = font_size
      self.gravity   = Magick::CenterGravity
    end
    name = get_current_user.name
    scaled_img.write("public/images/#{name}.png") # save
  end
end
