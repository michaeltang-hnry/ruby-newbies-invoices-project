class CreateClients < ActiveRecord::Migration[8.1]
  def up
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :company

      t.timestamps
    end
  end

  def down
    drop_table :clients
  end
end
