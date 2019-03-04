json.extract! cart, :id, :user_id, :order_id, :item_id, :quantity, :created_at, :updated_at
json.url cart_url(cart, format: :json)
