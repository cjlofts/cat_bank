class AddDeposits < ActiveRecord::Migration[7.1]
  def change
    create_table :deposits do |t|
      t.belongs_to :account
      t.bigint :amount
      t.timestamps
    end
  end
end
