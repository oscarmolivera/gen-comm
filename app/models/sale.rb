class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :sale_details
end
