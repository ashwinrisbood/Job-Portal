class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.search(params)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    unless !user_signed_in? or current_user.isAdmin?
      flash[:notice] = "Only admins can do that"
      redirect_to root_path
    end
    @company = Company.new
  end

  def redirect_unless_admin
    unless !user_signed_in? or current_user.isAdmin?
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        if not user_signed_in?
          format.html { redirect_to signup_path, notice: 'Company was successfully created.' }
        else
          format.html { redirect_to @company, notice: 'Company was successfully created.' }
        end
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    if User.find_by_company_id(@company.id)
      User.find_by_company_id(@company.id).update(company_id: nil)
      User.find_by_company_id(@company.id).update(isRecruiter: false)
    end
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def company_params
    params.require(:company).permit(:id, :name, :website, :hq, :size, :Founded, :industry, :revenue, :synopsis)
  end
end
