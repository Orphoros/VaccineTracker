class Vaccination < ApplicationRecord
  has_many :vaccines, dependent: :restrict_with_exception
end
