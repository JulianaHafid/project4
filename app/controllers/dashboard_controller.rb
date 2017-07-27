class DashboardController < ApplicationController
  def index
    @profiles = Profile.where(user_id: current_user)
    #@services = Services.where(task_list: "Babysitting")
    @services = Service.where(seeker_id: current_user)
    @services1 = Service.where(helper_id: current_user)
    
    #@test =  Service.where(service_type: "Seeking Help")


  end

  def match
    @services = Service.all
    render layout: "match"


  end

end
