class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :service_type
      t.references :seeker, index:true
      t.references :helper, index:true
      t.text :task_list
      t.text :review_for_helper
      t.integer :rating_for_helper
      t.text :review_for_seeker
      t.integer :rating_for_seeker
      t.date :date_when_seek_help

      t.timestamps
    end
  end
end
