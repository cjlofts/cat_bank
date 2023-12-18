require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_one(:account) }

  context 'when creating a user' do 
    let(:test_user) do
      User.create!(email: 'test@mail.com', password: 'testpassword')
    end
    
    it 'creates an Account' do
      expect(test_user.account).not_to be_nil
    end

    it 'creates an AccountTransaction' do
      expect(test_user.account.account_transactions.count).to eq(1)
    end

    it 'creates a Deposit' do
      expect(test_user.account.deposits.count).to eq(1)
    end
  end
end