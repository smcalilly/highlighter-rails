require 'test_helper'

class HighlightTest < ActiveSupport::TestCase
  test 'highlight fields must not be empty' do
    highlight = Highlight.new
    assert highlight.invalid?
    assert highlight.errors[:text].any?
    assert highlight.errors[:url].any?
  end
end
