class TransferService

  def initialize(transfer_params, from_account_id)
    @params = transfer_params
    @from_account_id = from_account_id
  end

  def run
    ActiveRecord::Base.transaction do
      transfer = create_transfer
      create_transfer_out_with_transaction(from_account, transfer)
      create_transfer_in_with_transaction(to_account, transfer)
    end
  end

  private

  attr_reader :params, :from_account_id

  def from_account
    Account.find(from_account_id)
  end

  def to_account
    User.find_by(email: params[:user_email]).account
  end

  def transfer_amount
    @transfer_amount ||= (params[:transfer].to_f * 100).to_i
  end

  def create_transfer
    Transfer.create!(transfer_from_account_id: from_account.id, transfer_to_account_id: to_account.id)
  end

  def create_transfer_out_with_transaction(account, transfer)
    transfer_out = TransferOut.create!(account: account, amount: transfer_amount, transfer: transfer)
    AccountTransaction.create!(account: account, transactable: transfer_out)
  end

  def create_transfer_in_with_transaction(account, transfer)
    transfer_in = TransferIn.create!(account: account, amount: transfer_amount, transfer: transfer)
    AccountTransaction.create!(account: to_account, transactable: transfer_in)
  end

end