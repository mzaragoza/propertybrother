class CreateAccountPayments < ActiveRecord::Migration
  def change
    create_table :account_payments do |t|
      t.integer :account_id
      t.string :payment_type
      t.datetime :payment_date
      t.decimal :amount
      t.timestamps null: false
    end
  end
end
