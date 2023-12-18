require 'rails_helper'

RSpec.describe TransferService do

  context 'transfering Silveuros to another user' do
    let(:user_one) do
      User.create!(email: 'test_one@mail.com', password: 'testpassword')
    end
    let(:user_two) do
      User.create!(email: 'test_two@mail.com', password: 'testpassword')
    end
    let(:transfer_params) { { user_email: user_two.email, transfer: '12.25' } }

    subject { TransferService.new(transfer_params, user_one.account.id) }

    it 'creates a Transfer' do
      expect { subject.run }.to change { Transfer.count }.by(1)
    end

    context 'transfering Silveuros from user_one to user_two' do
      before { subject.run }

      it 'creates a transfer_out for user one' do
        expect(user_one.account.transfer_outs.count).to eq(1)
      end

      it 'creates an account_transaction for user one' do
        expect(user_one.account.account_transactions.count).to eq(2)
      end

      it 'creates a transfer_in for user two' do
        expect(user_two.account.transfer_ins.count).to eq(1)
      end

      it 'creates an account_transaction for user two' do
        expect(user_two.account.account_transactions.count).to eq(2)
      end
    end
  end
end