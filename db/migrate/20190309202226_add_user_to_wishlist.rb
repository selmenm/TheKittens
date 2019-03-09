class AddUserToWishlist < ActiveRecord::Migration[5.2]
  def change
  	add_reference :wishlists, :user, index: true

  end
end
