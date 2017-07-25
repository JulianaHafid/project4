class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.integer :contact
      t.string :address
      t.string :gender

      t.timestamps
    end
  end
end
