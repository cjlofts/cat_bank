require 'rails_helper'

RSpec.describe TransferOut, type: :model do

  it { should belong_to(:account) }
  it { should belong_to(:transfer) }
  
end