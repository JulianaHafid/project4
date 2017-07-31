class DashboardController < ApplicationController
  def index
    @profiles = Profile.where(user_id: current_user)
    #@services = Services.where(task_list: "Babysitting")
    @services = Service.where(seeker_id: current_user)
    @services1 = Service.where(helper_id: current_user)
    #@test =  Service.where(service_type: "Offering Help")

    #query all reviews associated to current user
    @review1 = Service.where(seeker_id: current_user)
    @review2 = @review1.where.not(helper_id: nil)
    @review = @review2.where("date_when_seek_help < ?", Date.today )
  end

  def seekers
    if params[:search]
      #Find all record with service_type = "Seeking Help" and task_list meets the search string
      @seeking = Service.where(service_type: "Seeking Help")
      @search = @seeking.where("task_list ilike ?", "%#{params[:search]}%")
    else
      # if search string is empty
      @search = Service.where(service_type: "Seeking Help")
    end
    #render layout: "match"
  end

  def helpers
    if params[:search]
      #Find all record with service_type = "Seeking Help" and task_list meets the search string
      @seeking = Service.where(service_type: "Offering Help")
      @search = @seeking.where("task_list ilike ?", "%#{params[:search]}%")
    else
      # if search string is empty
      @search = Service.where(service_type: "Offering Help")
    end
    #render layout: "match"
  end
end
