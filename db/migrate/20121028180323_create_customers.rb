class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :zip_code

      t.timestamps
    end
  end
end
