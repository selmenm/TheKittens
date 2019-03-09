require 'rails_helper'

RSpec.describe "wishlists/edit", type: :view do
  before(:each) do
    @wishlist = assign(:wishlist, Wishlist.create!())
  end

  it "renders the edit wishlist form" do
    render

    assert_select "form[action=?][method=?]", wishlist_path(@wishlist), "post" do
    end
  end
end
