class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  def self.search(params)
    results = Company.all
    results = results.where(company_id: params[:company_id]) if params[:company_id].present?
    if params[:search].present?
      results = results.where('LOWER(companies.name) LIKE :search OR LOWER(companies.industry) LIKE :search OR LOWER(companies.hq) LIKE :search',search: "%#{params[:search]}%")
    end
    results
  end
end
