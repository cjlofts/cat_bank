class AddTransfers < ActiveRecord::Migration[7.1]
  def change
    create_table :transfers do |t|
      t.bigint :transfer_from_account_id, null: false
      t.bigint :transfer_to_account_id, null: false
      t.timestamps
    end
  end
end