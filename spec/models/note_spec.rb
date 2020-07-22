require 'spec_helper'
require 'models/concerns/taggable_spec.rb'

RSpec.describe Note, :type => :model do
  it_behaves_like "taggable"
end