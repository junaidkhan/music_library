class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.varchar :name
      t.varchar :active_years
      t.datetime :created_at
      t.datetime :updated_at
      t.text :biography

      t.timestamps
    end
  end
end
