class MarketingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if user_signed_in?
      redirect_to home_path
    end
  end

  def editor
    @note = Note.find(5)
  end

  def extension
  end
end
