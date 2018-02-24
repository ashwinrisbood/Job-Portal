class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy, foreign_key: "id"
end
