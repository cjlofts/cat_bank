require 'rails_helper'

RSpec.describe TransferIn, type: :model do

  it { should belong_to(:account) }
  it { should belong_to(:transfer) }
  
end