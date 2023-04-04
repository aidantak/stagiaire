class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.text :bio
      t.string :avatar
      t.text :past_experience

      t.timestamps
    end
  end
end
