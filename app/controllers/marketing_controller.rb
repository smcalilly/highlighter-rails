class MarketingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :editor]

  def index
    if user_signed_in?
      redirect_to home_path
    end
  end

  def editor
    @note = Note.new
  end
end
