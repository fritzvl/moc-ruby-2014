class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :service
      t.string :data
      t.timestamps null: false
    end
  end
end
