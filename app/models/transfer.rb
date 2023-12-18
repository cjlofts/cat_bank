class Transfer < ApplicationRecord

  has_one :transfer_in
  has_one :transfer_out

  def account_from_email
    Account.find(self.transfer_from_account_id).user.email
  end

  def account_to_email
    Account.find(self.transfer_to_account_id).user.email
  end

end
