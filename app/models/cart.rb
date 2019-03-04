class Cart < ApplicationRecord

  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :item

 # ADD FUNCTION MINUS PLUS ARTICLE
 
end
