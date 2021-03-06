class CreateLcls < ActiveRecord::Migration
  def change
    create_table :lcls do |t|
      t.integer :container_id
      t.integer :consignee_id, null: false
      t.string :description, null: false
      t.string :destination_name
      t.float :dest_lat, null: false
      t.float :dest_long, null: false

      t.timestamps null: false
    end
  end
end
# {
#   "container_id": "asdfao21345",
#   "lcl_id": "3"
# }