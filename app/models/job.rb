class Job < ApplicationRecord
  belongs_to :company
  has_many :applications, dependent: :destroy
  def self.search(params)
    results = Job.all
    results = results.where(company_id: params[:company_id]) if params[:company_id].present?
    if params[:search].present?
      results = results.joins(:company).where('LOWER(companies.name) LIKE :search OR LOWER(companies.industry) LIKE :search OR LOWER(companies.hq) LIKE :search',search: "%#{params[:search]}%")
    end
    results
  end
end
