class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.string :identifier, null: false
      
      t.decimal :total, precision: 10, scale: 2, default: 0.0

      t.index :identifier, unique: true

      t.timestamps
    end
  end
end