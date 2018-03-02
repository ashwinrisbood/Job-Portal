class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def update
    @profile = Profile.find(params[:id])
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_path }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to profiles_path
    else
      render "new"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end

  private
  def profile_params
    params.require(:profile).permit(:no_of_workex_years, :current_company, :user_id, :attachment).merge(user: current_user). merge(name: current_user.name)
  end
end
