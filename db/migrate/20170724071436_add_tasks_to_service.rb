class AddTasksToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :task_list, :string, array:true, default: []
  end
end
