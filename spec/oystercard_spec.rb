require 'oystercard'
require 'journey'

describe Oystercard do
  subject(:oystercard) { described_class.new}

   let(:entry_station) { double :station }
   let(:exit_station) { double :station }
   let (:journey) { { entry_station: entry_station, exit_station: exit_station}}

  it 'Balance method returns 0 when initialized' do
    expect(oystercard.balance).to eq 0
  end

  it "can store journeys" do
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journey.journeys).to eq journey
  end

  describe ' #touch_in' do
    it 'in_journey becomes true when oystercard touched in' do
       oystercard.top_up(20)
       oystercard.touch_in(entry_station)
       expect(oystercard.journey.status).to eq true
    end
  end

    it 'checks if a card with insufficient balance is touched in' do
      expect{oystercard.touch_in(entry_station)}.to raise_error 'You have insufficient credit'
    end

    it 'remembers the entry station' do
      oystercard.top_up(10)
      expect(oystercard.touch_in(entry_station)).to eq entry_station
    end


  describe ' #touch_out' do
    it 'in_journey becomes false when oystercard touched out' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.journey.status).to eq false
    end

    it 'balance decreases when oystercard touched out' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by -1
    end
      it 'forgets the entry station when touching out' do
        oystercard.top_up(20)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journey.entry_station).to eq nil
      end

      it "remembers the exit station" do
        oystercard.top_up(20)
        oystercard.touch_in(entry_station)
        expect(oystercard.touch_out(exit_station)).to eq exit_station
      end

      it 'without touch_in, doing check_out' do
        oystercard.touch_out(exit_station)
        expect(oystercard.journey.entry_station).to eq nil
      end

      it 'shows the all journey' do
        oystercard.top_up(20)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journey.journeys).to eq journey
      end
  end

  describe ' #top_up' do

    it 'raises error if new balance exceeds limit' do
      subject.top_up(Oystercard::MAX_LIMIT)
      expect{oystercard.top_up(1)}.to raise_error "You have exceeded the limit of #{Oystercard::MAX_LIMIT}"
    end

    it 'top up method sets new balance to 20' do
      subject.top_up(20)
      expect(oystercard.balance).to eq 20
    end

    it 'increase balance (using change rspec syntax)' do
      expect {oystercard.top_up 20}.to change{subject.balance}.by 20
    end
  end

  describe ' #deduct' do
    it 'oystercard recieves deduct method' do
      oystercard.send(:deduct, 5)
    end

    it 'oystercard receives deduct method and deducts ticket' do
      expect {oystercard.send(:deduct, 5) }.to change{oystercard.balance}.by -5
    end
  end
end
