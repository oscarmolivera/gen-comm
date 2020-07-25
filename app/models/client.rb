class Client < ApplicationRecord
  has_many :sales

  validates :name, :email, :address, :telephone, presence: true

end
