class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :service_type
      t.references :seeker, index:true
      t.references :helper, index:true
      t.string :task_list
      t.text :review_for_helper
      t.integer :rating_for_helper
      t.text :review_for_seeker
      t.integer :rating_for_seeker

      t.timestamps
    end
  end
end
