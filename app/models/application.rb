class Application < ApplicationRecord
  belongs_to :user
  belongs_to :job
  def self.search(params,par2)
    results = Application.where(user_id: par2)
    results = results.where(job_id: params[:job_id]) if params[:job_id].present?
    if params[:search].present?
      results = results.joins(:job).where('applications.name LIKE :search OR applications.current_company LIKE :search OR jobs.position LIKE :search' ,search: "%#{params[:search]}%")
    end
    results
  end
end
