class AddWithdrawls < ActiveRecord::Migration[7.1]
  def change
    create_table :withdrawls do |t|
      t.belongs_to :account
      t.bigint :amount
      t.timestamps
    end
  end
end
