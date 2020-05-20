require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) do 
    Event.create(
      name: 'event1', 
      start_date: Date.today - 10, 
      end_date: Date.today - 5
    )
  end

  it { should have_many(:event_participants)  }
  it { should have_many(:tickets)  }
  it { should have_many(:users).through(:event_participants) }

  it "applies a default scope to events by created_at ascending" do
    expect(Event.all.to_sql).to eq Event.all.order(created_at: :asc).to_sql
  end

  it 'should return true if past event' do
    expect(event.past?).to eq true
  end
end