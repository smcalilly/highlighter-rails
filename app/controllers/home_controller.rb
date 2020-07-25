class HomeController < ApplicationController
  include Markdownable
  
  def index
    @highlights = policy_scope(Highlight.order(created_at: :desc))

    @notes = policy_scope(Note).all
    @no_markdown = no_markdown

    @sources = policy_scope(Source)

    @tags = policy_scope(Tag)
  end
end