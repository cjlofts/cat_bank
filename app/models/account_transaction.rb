class AccountTransaction < ApplicationRecord

  belongs_to :account
  belongs_to :transactable, polymorphic: true
  
end
