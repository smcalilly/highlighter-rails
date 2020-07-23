require 'redcarpet/render_strip'
module Markdownable
  def generate_markdown
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  end

  def no_markdown
    @no_markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
  end
end