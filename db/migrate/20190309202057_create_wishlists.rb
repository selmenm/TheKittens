class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|

      t.timestamps
    end
  end
end
