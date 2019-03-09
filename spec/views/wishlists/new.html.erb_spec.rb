require 'rails_helper'

RSpec.describe "wishlists/new", type: :view do
  before(:each) do
    assign(:wishlist, Wishlist.new())
  end

  it "renders new wishlist form" do
    render

    assert_select "form[action=?][method=?]", wishlists_path, "post" do
    end
  end
end
