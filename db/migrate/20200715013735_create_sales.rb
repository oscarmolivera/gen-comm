class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.decimal :amount
      t.references :user, null: false, foreign_key: true
      t.references :client, null: true, foreign_key: true

      t.timestamps
    end
  end
end
