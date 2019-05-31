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
    puts "create!!!"
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
end
