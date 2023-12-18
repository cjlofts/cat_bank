require 'rails_helper'

RSpec.describe AccountTransaction, type: :model do

  it { should belong_to(:account) }
  it { should belong_to(:transactable) }

end