class ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /applications
  # GET /applications.json
  def index
    if (current_user.id!=1)
      #@applications = Application.where(user_id: current_user.id)
      @applications = Application.search(params,current_user.id)
    else
      @applications = Application.all
    end
    #@applications = Application.search(params)
    #@job = Job.find(params[:job_id])
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
  end

  def status
    Job.where(id: params[:job_id]).update(isClosed: true)
    Application.where(job_id: params[:job_id]).update_all(status: 'No Longer In Consideration')
    Application.where(job_id: params[:job_id], user_id: params[:user_id]).update(status: 'Selected')
    ApplicationsMailer.congratulations(User.find(params[:user_id]), Job.find(params[:job_id])).deliver
    Application.where(job_id: params[:job_id]).each do |applications|
      if applications.user_id!=params[:user_id]
        ApplicationsMailer.no_consideration(User.find(applications.user_id), Job.find(params[:job_id])).deliver
      end
    end
    redirect_to job_path
  end

  # GET /applications/new
  def new
    @application = Application.new
    @job = Job.find(params[:job_id])
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications
  # POST /applications.json
  def create
    @application = Application.new(application_params)
    if not Application.exists?(job_id: application_params[:job_id], user_id: current_user.id)
    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to applications_path, notice: 'You Cannot Apply to the same Job Twice'
      end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.require(:application).permit(:name, :current_company, :linkedin, :add_info, :gender, :race, :disability, :job_id).merge(user_id: current_user.id)
    end
end
