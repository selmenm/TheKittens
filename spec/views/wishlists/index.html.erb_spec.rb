require 'rails_helper'

RSpec.describe "wishlists/index", type: :view do
  before(:each) do
    assign(:wishlists, [
      Wishlist.create!(),
      Wishlist.create!()
    ])
  end

  it "renders a list of wishlists" do
    render
  end
end
