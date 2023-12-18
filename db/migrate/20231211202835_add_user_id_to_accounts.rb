class AddUserIdToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :accounts, :user, index: true
    add_foreign_key :accounts, :users
  end
end
