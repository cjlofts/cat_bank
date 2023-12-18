require 'rails_helper'

RSpec.describe Deposit, type: :model do

  it { should belong_to(:account) }
  
end