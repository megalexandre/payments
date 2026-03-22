class AddStatusToPayments < ActiveRecord::Migration[8.1]
  def change
    add_column :payments, :status, :string, default: "pending"
    add_index :payments, :status
  end
end
