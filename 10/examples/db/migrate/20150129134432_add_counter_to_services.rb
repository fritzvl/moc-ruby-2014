class AddCounterToServices < ActiveRecord::Migration
  def change
    add_column :services, :counter, :integer, default: 0
  end
end
