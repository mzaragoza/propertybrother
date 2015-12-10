class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :account_documents do |t|
      t.string   "account_id"
      t.string   "name"
      t.string   "document_type"
      t.string   "file"
      t.text     "description"

      t.timestamps null: false
    end
  end
end
