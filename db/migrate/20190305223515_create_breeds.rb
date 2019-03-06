class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.string :name
      t.timestamps
    end
    add_reference :items, :breed, index: true
  end
end
