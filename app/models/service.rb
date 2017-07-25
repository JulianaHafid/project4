class Service < ApplicationRecord
  before_save do
    self.task_list.gsub!(/[\[\]\"]/, "") if attribute_present?("task_list")
  end
end
