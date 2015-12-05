class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :subdomain,              null: false, default: ""
      t.string :name,              null: false, default: ""
      t.string :address,              null: false, default: ""
      t.string :city,              null: false, default: ""
      t.string :state,              null: false, default: ""
      t.string :zip,              null: false, default: ""
      t.integer :number_of_appartments
      t.decimal :monthly_fee

      t.timestamps null: false
    end
      add_index :accounts, :subdomain, :unique => true
  end
end
