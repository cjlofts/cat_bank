class AccountTransactionsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @account = current_user.account
    account_transactions = current_user.account.account_transactions
    @account_transactions = account_transactions.order(created_at: 'desc').limit(10)
  end
end