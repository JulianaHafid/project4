class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.integer :seeker_id
      t.integer :helper_id

      t.timestamps
    end
  end
end
