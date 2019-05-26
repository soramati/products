class CardsController < ApplicationController

  def index
  	@cards = Card.where(user_id: get_current_user.name)
  	@card = Card.new
  end

  def create
  	card = Card.new(card_params)
    card.user_id = get_current_user.name.to_i
  	card.save!
  	redirect_to "/"
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
  def card_params
  	params.require(:card).permit(:title)
  end
end
