class ChangeProductPriceToAcceptFloatDecimals < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, precision: 5, scale: 2, null: false, default: 0.00
  end
end
