require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should have_many(:event_participants)  }
  it { should have_many(:events).through(:event_participants) }

  describe "email validations" do
    subject { User.create(
                email: 'test@gmail.com', 
                name: 'test',
                password: '11111111'
              ) 
            }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it do 
    should define_enum_for(:gender).
      with_values(
        male: 'male', 
        female: 'female'
      ).backed_by_column_of_type(:string)
  end

  describe 'attending_event? ' do
    let(:user) { 
                  User.create(
                    email: 'test@gmail.com', 
                    name: 'test',
                    password: '11111111'
                  ) 
                }
    let(:event1) { double(:event) }
    let(:event2) { double(:event) }
    
    it "should return false" do
      allow(user).to receive(:events) { [1,2,3,4] }
      allow(event1).to receive(:exists?) { false }
      expect(user.attending_event?(event2)).to eq false
    end
  end

end


