class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.text :body
      t.references :writer
      t.timestamps null: false
    end
  end
end
