require 'rails_helper'

RSpec.describe Withdrawl, type: :model do

  it { should belong_to(:account) }

end