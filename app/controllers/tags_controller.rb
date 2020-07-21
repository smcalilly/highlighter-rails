class TagsController < ApplicationController
  def index
    @tags = policy_scope(Tag.order(created_at: :desc))
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
