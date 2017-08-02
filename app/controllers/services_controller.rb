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
    # get from Service table where service type = "Offering Help"
    @test1 = Service.where("service_type ilike ?", "%Offering Help%")
    # get from Service table where id is what is passed in params"
    @test2 = Service.find(params[:id]).task_list
    # get from Service table where those task_list matches what the current user have in a particular service id"
    @test0 = @test1.where("task_list ilike ?", "%#{@test2}%")
    #from the results in the query @test0 , only display those with helper_id not equal to current user
    @test = @test0.where.not(helper_id: current_user)

    #Query for Review

    render layout: "show"
  end

  # GET /services/new
  def new
    @service = Service.new
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
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
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
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def book
    @service = Service.find(params[:service_id])
    @helperid = params[:helper_id]
    @service.update_attribute(:helper_id, @helperid)
    respond_to do |format|
        format.html {render :nothing => true}
        format.js
    end
  end

  def review
    @service = Service.find(params[:id])
    service = Service.find(params[:id])
    @service.review_for_helper= params[:review_for_helper]
    @service.rating_for_helper= params[:rating_for_helper]
    @service.save
      respond_to do |format|
          format.html {render :nothing => true}
          format.js
      end
  end

  # def reviewupdate
  #   @service = Service.find(params[:id])
  #   @helper= (params[:review_for_helper])
  #   # @service.review_for_helper= params[:review_for_helper]
  #   # @service.rating_for_helper= params[:rating_for_helper]
  #   # puts "in review update"
  #   # @service.save
  #   # respond_to do |format|
  #   #     format.html {render :nothing => true}
  #   #     format.js
  #   # end
  #   #redirect_to dashboard_index_url
  # end

  # DELETE /services/1
  # DELETE /services/1.json
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
      params.require(:service).permit(:id, :seeker_id, :helper_id,:date_when_seek_help, :review_for_helper, :rating_for_helper, :review_for_seeker, :rating_for_seeker, :service_type, task_list:[])
    end
end
