class ProfilesController < ApplicationController
  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end


  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      redirect_to resumes_path, notice: "The Profile #{@profile.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path, notice:  "The Profile #{@profile.name} has been deleted."
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :no_of_workex_years, :current_company, :user_id, :attachment).merge(user: current_user)
  end
end
