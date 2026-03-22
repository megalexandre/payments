class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.datetime :exchanged_at
      t.datetime :due_date

      t.timestamps
    end
  end
end
