class CreateSaleDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_details do |t|
      t.decimal :quantity
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
