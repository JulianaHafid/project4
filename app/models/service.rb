class Service < ApplicationRecord
  belongs_to :seeker, class_name: 'User', optional: true
  belongs_to :helper, class_name: 'User', optional: true


  before_save do
    self.task_list.gsub!(/[\[\]\"]/, "") if attribute_present?("task_list")
  end

end
