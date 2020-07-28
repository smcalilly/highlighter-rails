require 'rails_helper'

RSpec.describe "assortments/new", type: :view do
  before(:each) do
    assign(:assortment, Assortment.new(
      name: "MyString"
    ))
  end

  it "renders new assortment form" do
    render

    assert_select "form[action=?][method=?]", assortments_path, "post" do

      assert_select "input[name=?]", "assortment[name]"
    end
  end
end
