class AddAccountTransaction < ActiveRecord::Migration[7.1]
  def change
    create_table :account_transactions do |t|
      t.belongs_to :account
      t.references :transactable, polymorphic: true
      t.timestamps
    end
  end
end
