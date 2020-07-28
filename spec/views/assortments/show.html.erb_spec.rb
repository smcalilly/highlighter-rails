require 'rails_helper'

RSpec.describe "assortments/show", type: :view do
  before(:each) do
    @assortment = assign(:assortment, Assortment.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
