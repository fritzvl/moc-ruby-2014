class CreateServicesTable < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :label
      t.date :last_visited_at
    end
  end
end



# class CreateServicesTable < ActiveRecord::Migration
#
#   def up
#     create_table :services do |t|
#
#     end
#   end
#
#   def down
#     drop_table :services
#   end
#
# end