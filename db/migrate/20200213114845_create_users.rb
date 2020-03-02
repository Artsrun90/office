class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :userName
      t.string :login
      t.string :password
      t.string :gender
      t.date :date_Of_Birth
      t.references :roll, null: false,  foreign_key: true

      t.timestamps
    end
  end
end
