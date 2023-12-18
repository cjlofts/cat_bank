require 'rails_helper'

RSpec.describe Transfer, type: :model do

  it { should have_one(:transfer_in) }
  it { should have_one(:transfer_out) }
  
end