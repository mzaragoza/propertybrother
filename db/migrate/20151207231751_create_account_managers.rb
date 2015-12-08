class CreateAccountManagers < ActiveRecord::Migration
  def change
    create_table :account_managers do |t|
      t.integer :account_id
      t.integer :manager_id
      t.boolean :lead, default: false
      t.timestamps null: false
    end
  end
end
