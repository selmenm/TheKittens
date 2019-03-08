class AddUserToItems < ActiveRecord::Migration[5.2]
  def change
  	add_reference :items, :admin, index: true
  end
end
