class DepositsController < ApplicationController
  before_action :authenticate_user!

  def create
    ActiveRecord::Base.transaction do
      deposit = Deposit.create!(account: account, amount: deposit_amount)
      AccountTransaction.create!(account: account, transactable: deposit)
    end

    redirect_to account
  end

  private

  def account
    @account ||= Account.find(params[:account_id])
  end

  def deposit_params
    params.require(:deposit)
  end

  def deposit_amount
    (deposit_params[:deposit].to_f * 100).to_i
  end
end