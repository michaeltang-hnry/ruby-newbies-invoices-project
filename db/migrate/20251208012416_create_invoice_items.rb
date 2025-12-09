class CreateInvoiceItems < ActiveRecord::Migration[8.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :description
      t.integer :quantity
      t.decimal :per_cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
