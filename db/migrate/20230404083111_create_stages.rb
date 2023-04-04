class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.references :user, null: false, foreign_key: true
      t.string :restaurant_name
      t.string :title
      t.text :description
      t.datetime :datetime
      t.string :location

      t.timestamps
    end
  end
end
