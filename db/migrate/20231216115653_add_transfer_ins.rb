class AddTransferIns < ActiveRecord::Migration[7.1]
  def change
    create_table :transfer_ins do |t|
      t.belongs_to :account
      t.bigint :amount
      t.timestamps
      t.references :transfer_in
    end
  end
end
