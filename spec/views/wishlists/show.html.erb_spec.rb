require 'rails_helper'

RSpec.describe "wishlists/show", type: :view do
  before(:each) do
    @wishlist = assign(:wishlist, Wishlist.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
