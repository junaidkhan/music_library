class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.varchar :name
      t.varchar :password

      t.timestamps
    end
  end
end
