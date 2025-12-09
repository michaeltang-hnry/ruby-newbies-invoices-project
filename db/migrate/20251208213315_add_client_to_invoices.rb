class AddClientToInvoices < ActiveRecord::Migration[8.1]
  def up
    add_reference :invoices, :client, null: false, foreign_key: true
  end

  def down
    remove_reference :invoices, :client, foreign_key: true
  end
end