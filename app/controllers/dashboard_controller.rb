class DashboardController < ApplicationController
  def index
    @profiles = Profile.where(user_id: current_user)
    #@services = Services.where(task_list: "Babysitting")
    @services = Service.where(seeker_id: current_user)
    @services1 = Service.where(helper_id: current_user)
    #@test =  Service.where(service_type: "Offering Help")
  end

  def seekers
    @seekers =  Service.where(service_type: "Seeking Help")
    #render layout: "match"
  end

  def helpers
    @helpers =  Service.where(service_type: "Offering Help")
    #render layout: "match"
  end
end
