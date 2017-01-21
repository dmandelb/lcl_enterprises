class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false, unique: true
      t.string :phone, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
