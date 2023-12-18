class WithdrawlsController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.transaction do
      withdrawl = Withdrawl.create!(account: account, amount: withdrawl_amount)
      AccountTransaction.create!(account: account, transactable: withdrawl)
    end

    redirect_to account
  end

  private

  def account
    @account ||= Account.find(params[:account_id])
  end

  def withdrawl_params
    params.require(:withdrawl)
  end

  def withdrawl_amount
    (withdrawl_params[:withdrawl].to_f * 100).to_i
  end
end