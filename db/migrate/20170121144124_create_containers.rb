class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :container_number, null: false, unique: true

      t.timestamps null: false
    end
  end
end
