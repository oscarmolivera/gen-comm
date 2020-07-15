class WarehouseRecord < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  belongs_to :user
end
