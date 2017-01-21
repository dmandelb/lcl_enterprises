class CreateCompaniesLcls < ActiveRecord::Migration
  def change
    create_table :companies_lcls do |t|

      t.timestamps null: false
    end
  end
end
