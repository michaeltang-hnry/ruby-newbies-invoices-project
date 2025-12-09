class CreateInvoiceItems < ActiveRecord::Migration[8.1]
  def up
    create_table :invoice_items do |t|
      t.references :invoice, null: false, foreign_key: true
      t.string :description
      t.integer :quantity
      t.decimal :per_cost, precision: 10, scale: 2

      t.timestamps
    end
  end

  def down
    drop_table :invoice_items
  end
end
