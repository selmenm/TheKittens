class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
