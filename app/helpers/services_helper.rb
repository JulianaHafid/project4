module ServicesHelper
  def checked(area)
    @service.task_list.nil? ? false : @service.task_list.match(area)
  end

  

end
