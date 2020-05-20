require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should belong_to(:event) }

  it 'Female discount value' do
    expect(Ticket::FEMALE_DISCOUNT).to eq 0.05
  end
end

