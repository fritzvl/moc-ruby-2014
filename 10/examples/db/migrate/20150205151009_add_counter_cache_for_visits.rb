class AddCounterCacheForVisits < ActiveRecord::Migration
  def change
    add_column :services, :visits_count, :integer
  end
end
