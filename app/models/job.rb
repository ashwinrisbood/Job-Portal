class Job < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  def self.search(params)
    results = Job.all
    results = results.where(company_id: params[:company_id]) if params[:company_id].present?
    if params[:search].present?
      results = results.joins(:company).where('companies.name LIKE :search OR companies.industry LIKE :search OR companies.Hq LIke :search',search: "%#{params[:search]}%")
    end
    results
  end
end
