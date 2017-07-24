class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :initiated_by
      t.integer :seeker_id
      t.integer :helper_id
      t.string :task_list

      t.timestamps
    end
  end
end
