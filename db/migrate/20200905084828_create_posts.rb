class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title ,null:false
      t.string :text   
      t.integer :genre_id, null:false

      t.timestamps
    end
  end
end
