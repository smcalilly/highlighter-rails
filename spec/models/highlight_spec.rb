require 'spec_helper'
require 'models/concerns/taggable_spec.rb'

RSpec.describe Highlight, :type => :model do
  it_behaves_like "taggable"
end