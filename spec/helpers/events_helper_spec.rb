require 'rails_helper'

RSpec.describe EventsHelper, type: :helper do
  
  let(:ticket) { double(:ticket, amount: 100, currency: 'USD') }  
  let(:user1) { double(:user, female?: false)}
  let(:event) { double(:event, id: 1) }

  describe 'show_ticket_price' do
    let(:user2) { double(:user, female?: true)}
    
    context 'when gender is male' do
      it 'should show original amount' do
        expect(show_ticket_price(user: user1, ticket: ticket)).to eq('USD 100')
      end
    end

    context 'when gender is female' do
      it 'should show discount amount' do
        expect(show_ticket_price(user: user2, ticket: ticket)).to eq('USD 95.0')
      end
    end
  end

  describe 'original_ticket_price' do
    it 'should give original ticket price' do
      expect(show_ticket_price(user: user1, ticket: ticket)).to eq('USD 100')
    end
  end

  describe 'event_registration_cta' do
    before do
      allow(user1).to receive(:events).and_return event
    end
    context 'user is not attending the show' do
      it 'should show CTA as Attend' do
        allow(user1).to receive(:attending_event?).and_return false
        expect(event_registration_cta(user: user1, event: event, ticket: ticket)).to include('Attend')
      end
    end

    context 'user is attending the show' do
      it 'should show CTA as Unattend' do
        allow(user1).to receive(:attending_event?).and_return true
        expect(event_registration_cta(user: user1, event: event, ticket: ticket)).to include('Unattend')
      end
    end
  end

  describe 'event_participation_allowed?' do
    context 'user is not logged in' do
      it 'should return false' do
        expect(event_participation_allowed?(nil, event)).to eq(nil)
      end
    end
    context 'user is logged in' do
      context 'when event is a past event' do
        it 'should return false' do
          allow(event).to receive(:past?).and_return (true)
          expect(event_participation_allowed?(user1, event)).to eq(false)
        end
      end
      context 'when event is not a past event' do
        it 'should return true' do
          allow(event).to receive(:past?).and_return (false)
          expect(event_participation_allowed?(user1, event)).to eq(true)
        end
      end
    end
  end
end
