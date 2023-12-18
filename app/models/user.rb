class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account

  after_create :setup_account

  def setup_account
    account = create_account
    credit_account_with_opening_balance(account)
  end
  
  def create_account
    Account.create!(user: self)
  end
  
  def credit_account_with_opening_balance(account)
    deposit = Deposit.create!(account: account, amount: 10000)
    AccountTransaction.create!(account: account, transactable: deposit)
  end

end
