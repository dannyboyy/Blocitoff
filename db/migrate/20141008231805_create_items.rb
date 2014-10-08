class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :body
      t.integer :days_left
      t.boolean :complete

      t.timestamps
    end
  end
end
