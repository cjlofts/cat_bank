class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @deposit = Deposit.new(account: account)
    @withdrawl = Withdrawl.new(account: account)
    @transfer_out = TransferOut.new(account: account)
    @user_emails = user_emails
  end

  private

  def account
    @account ||= current_user.account
  end

  def user_emails
    User.all.where.not(email: current_user.email).pluck(:email)
  end
end