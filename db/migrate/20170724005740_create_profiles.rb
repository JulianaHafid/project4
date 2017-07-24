class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.integer :contact
      t.string :address
      t.string :gender
      t.string :image

      t.timestamps
    end
  end
end
