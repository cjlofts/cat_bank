class Account < ApplicationRecord

  belongs_to :user
  has_many :deposits
  has_many :withdrawls
  has_many :transfer_ins
  has_many :transfer_outs
  has_many :account_transactions

  def balance
    # (deposit_total + transfer_in_total - transfer_out_total - withdrawl_total) / 100
    deposit_total + transfer_in_total - transfer_out_total - withdrawl_total
  end

  private

  def deposit_total
    self.deposits.sum(&:amount)
  end

  def transfer_in_total
    self.transfer_ins.sum(&:amount)
  end

  def transfer_out_total
    self.transfer_outs.sum(&:amount)
  end

  def withdrawl_total
    self.withdrawls.sum(&:amount)
  end

end
