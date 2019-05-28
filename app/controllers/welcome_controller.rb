class WelcomeController < ApplicationController
	skip_before_action :login_required
  def index
	@images_name = params[:id]
  end
end
