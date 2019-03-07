class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :item

  def total_per_item
		return self.quantity.to_i * Item.find_by_id(self.item_id).price.to_i
	end

 # ADD FUNCTION MINUS PLUS ARTICLE
 
end