class DeviseCreateManagers < ActiveRecord::Migration
  def change
    create_table(:managers) do |t|
      ## Database authenticatable
      t.string :username,              null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name,              null: false, default: ""
      t.string :last_name,              null: false, default: ""
      t.string :home_phone
      t.string :cell_phone
      t.string :office_phone
      t.string :extension
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :title
      t.boolean :active,              null: false, default: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
       t.string   :confirmation_token
       t.datetime :confirmed_at
       t.datetime :confirmation_sent_at
       t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
       t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
       t.string   :unlock_token # Only if unlock strategy is :email or :both
       t.datetime :locked_at


      t.integer  :created_by_id, default: 0, null: false
      t.string :created_by_type,             null: false, default: ""
      t.integer  :deleted_by_id
      t.string :deleted_by_type
      t.datetime :deleted_at
      t.timestamps null: false
      t.datetime :deleted_at
    end

    add_index :managers, :email,                unique: true
    add_index :managers, :reset_password_token, unique: true
    add_index :managers, :confirmation_token,   unique: true
    add_index :managers, :unlock_token,         unique: true
  end
end
