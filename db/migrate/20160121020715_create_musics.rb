class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.string :rating
      t.references :user
      t.timestamps null:true
    end
  end
end
