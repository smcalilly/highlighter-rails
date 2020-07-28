require 'rails_helper'

RSpec.describe "assortments/index", type: :view do
  before(:each) do
    assign(:assortments, [
      Assortment.create!(
        name: "Name"
      ),
      Assortment.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of assortments" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
