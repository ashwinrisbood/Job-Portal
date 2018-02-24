json.extract! job, :id, :description, :type, :responsibilities, :requirements, :created_at, :updated_at
json.url job_url(job, format: :json)
