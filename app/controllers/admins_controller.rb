class AdminsController < ApplicationController
  before_action :require_admin
  def new
  end

  def edit
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@cards = Card.where(user_id: @user.name)
  end

  def index
  	@users = User.all
  end
  def destroy
  	user = User.find(params[:id])
  	cards = Card.where(user_id: user.name)
  	cards.destroy_all
  	user.destroy
  	redirect_to "/admins"
  end
  def destroy_all
  	user_all = User.all
  	user_all.destroy_all
  	card_all = Card.all
  	card_all.destroy_all
  	redirect_to "/admins"
  end

  private
    def require_admin
      redirect_to root_url unless get_current_user.admin?
    end
end
