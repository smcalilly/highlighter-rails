require 'rails_helper'

RSpec.describe "assortments/edit", type: :view do
  before(:each) do
    @assortment = assign(:assortment, Assortment.create!(
      name: "MyString"
    ))
  end

  it "renders the edit assortment form" do
    render

    assert_select "form[action=?][method=?]", assortment_path(@assortment), "post" do

      assert_select "input[name=?]", "assortment[name]"
    end
  end
end
