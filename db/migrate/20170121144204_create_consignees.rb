class CreateConsignees < ActiveRecord::Migration
  def change
    create_table :consignees do |t|
      t.string :name, null: false, unique: true
      t.string :phone, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
