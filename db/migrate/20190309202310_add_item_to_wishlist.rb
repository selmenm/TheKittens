class AddItemToWishlist < ActiveRecord::Migration[5.2]
  def change
  	add_reference :wishlists, :item, index: true
  end
end
