class Deputy < ApplicationRecord
  has_many :costs, dependent: :destroy
end
