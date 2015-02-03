class AddTimestampToService < ActiveRecord::Migration
  def change
    add_column :services, :created_at, :datetime
    add_column :services, :updated_at, :datetime
  end
end
