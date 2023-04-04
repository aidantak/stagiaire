class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :reviewer, null: false, foreign_key: { to_table: :users }
      t.references :reviewed, null: false, foreign_key: { to_table: :users }
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
