class CreateLcls < ActiveRecord::Migration
  def change
    create_table :lcls do |t|

      t.timestamps null: false
    end
  end
end
