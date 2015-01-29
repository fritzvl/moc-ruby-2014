class AddIndexOnCounterToServices < ActiveRecord::Migration
  def change
    add_index :services, :counter
  end
end
