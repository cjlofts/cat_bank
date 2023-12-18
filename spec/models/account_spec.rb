require 'rails_helper'

RSpec.describe Account, type: :model do

  it { should belong_to(:user) }
  it { should have_many(:deposits) }
  it { should have_many(:withdrawls) }
  it { should have_many(:transfer_ins) }
  it { should have_many(:transfer_outs) }
  it { should have_many(:account_transactions) }

end