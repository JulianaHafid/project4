class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
    #Query for service you help and seek

    #query to get the name from Profile table where seeker/helper id = user_id in Service table
    @getservice = Service.find(params[:id])
    @profile = Profile.where(user_id: @getservice.seeker_id).pluck(:name)
    @profile1 = Profile.where(user_id: @getservice.helper_id).pluck(:name)

    # get from Service table where service type = "Offering Help"
    @test1 = Service.where("service_type ilike ?", "%Offering Help%")
    # get from Service table where id is what is passed in params"
    @test2 = Service.find(params[:id]).task_list
    # get from Service table where those task_list matches what the current user have in a particular service id"
    @test0 = @test1.where("task_list ilike ?", "%#{@test2}%")
    #from the results in the query @test0 , only display those with helper_id not equal to current user
    @test = @test0.where.not(helper_id: current_user)

    #@ads = Ad.all(:joins => 'LEFT JOIN states ON ads.state_id = states.id')
    #@ads = @test(:joins => 'LEFT JOIN states ON @test.helper_id = profiles.user_id')
    #@ads = Service.all(:joins => 'LEFT JOIN profiles ON #{services.helper_id = profiles.user_id}')
    #@service1 = Profile.includes(:service).where(:service => { helper_id: user_id } ).all
    render layout: "empty"
  end

  # GET /services/new
  def new
    @service = Service.new
    render layout: "empty"
  end

  # GET /services/1/edit
  def edit

  end


  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)
    if @service.service_type === "seeking Help" || @service.service_type === "Seeking Help"
      @service.seeker_id = current_user.id
    else @service.service_type === "offering help" || @service.service_type === "Offering Help"
      @service.helper_id = current_user.id
    end
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, layout: "empty", notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, layout: "empty", notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  #when booking button click to book helpers
  def book
    @service = Service.find(params[:service_id])
    @helperid = params[:helper_id]
    @service.update_attribute(:helper_id, @helperid)
    respond_to do |format|
        format.html {redirect_to @service, notice: 'Service was successfully updated.'}
        format.json {render :show, status: :ok, location: @service}
        format.js
    end
  end

  #AJAX call to auto refresh page, rerender the show page
  def show_partial
    @service = Service.find(params[:service_id])
    return render @service
  end

  def review
    @service = Service.find(params[:id])
    service = Service.find(params[:id])
    @service.review_for_helper= params[:review_for_helper]
    @service.rating_for_helper= params[:rating_for_helper]
    @service.save
      respond_to do |format|
          format.html {render layout: "empty", :nothing => true}
          format.js
      end
  end


  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_index_path, notice: 'Service was successfully destroyed.' }
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
      params.require(:service).permit(:id, :seeker_id, :helper_id,:date_when_seek_help, :review_for_helper, :rating_for_helper, :review_for_seeker, :rating_for_seeker, :service_type, task_list:[])
    end
end
