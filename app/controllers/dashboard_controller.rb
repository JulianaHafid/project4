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
    render layout: "dashboard"
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
    render layout: "seekers"
  end

  def helpers
    if params[:search]
      #Find all record with service_type = "Seeking Help" and task_list meets the search string
      @User = User.all
      @seeking = Service.where(service_type: "Offering Help")
      @search = @seeking.where("task_list ilike ?", "%#{params[:search]}%")
    else
      # if search string is empty
      @search = Service.where(service_type: "Offering Help")
    end
    render layout: "helpers"
  end

  def sendmail
    # @user = User.new(params[:user])
    # UserMailer.welcome_email(@user).deliver
    # respond_to do |format|
    #     format.html {render layout: "empty", :nothing => true}
    #     format.js
    #end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:id, :seeker_id, :review_for_helper, :rating_for_helper, :review_for_seeker, :rating_for_seeker, :helper_id, :date_when_seek_help, :service_type, task_list:[])
    end


end
