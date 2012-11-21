class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.varchar :title
      t.datetime :release_date
      t.varchar :genre
      t.datetime :created_at
      t.datetime :updated_at
      t.decimal :price
      t.varchar :image_path
      t.int :artist_id

      t.timestamps
    end
  end
end
