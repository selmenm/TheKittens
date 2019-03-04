require 'rails_helper'

RSpec.describe "carts/new", type: :view do
  before(:each) do
    assign(:cart, Cart.new(
      :user => nil,
      :order => nil,
      :item => nil,
      :quantity => 1
    ))
  end

  it "renders new cart form" do
    render

    assert_select "form[action=?][method=?]", carts_path, "post" do

      assert_select "input[name=?]", "cart[user_id]"

      assert_select "input[name=?]", "cart[order_id]"

      assert_select "input[name=?]", "cart[item_id]"

      assert_select "input[name=?]", "cart[quantity]"
    end
  end
end
