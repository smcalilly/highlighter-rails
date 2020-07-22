class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = policy_scope(Tag)
  end

  def show
  end

  private
    def set_tag
      @tag = policy_scope(Tag).find(params[:id])
    rescue
      redirect_to notes_path, notice: "that tag doesn't exist."
    end
end
