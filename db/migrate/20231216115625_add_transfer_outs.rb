class AddTransferOuts < ActiveRecord::Migration[7.1]
  def change
    create_table :transfer_outs do |t|
      t.belongs_to :account
      t.bigint :amount
      t.timestamps
    end
  end
end
