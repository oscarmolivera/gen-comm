class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :client, optional: true
  has_many :sale_details, dependent: :destroy
end
