require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new}
  it 'Balance method returns 0 when initialized' do
    expect(oystercard.balance).to eq 0
  end

  it 'in_journey? returns false when initialized' do
    expect(oystercard.in_journey).to eq false
  end

  describe ' #touch_in' do
    it 'in_journey becomes true when oystercard touched in' do
      allow(oystercard).to receive(:balance).and_return 20
      oystercard.touch_in
      expect(oystercard.in_journey).to eq true
    end

    it 'checks if a card with insufficient balance is touched in' do
      expect{oystercard.touch_in}.to raise_error 'You have insufficient credit'
    end
  end

  describe ' #touch_out' do
    it 'in_journey becomes false when oystercard touched out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey).to eq false
    end
  end

  describe ' #top_up' do

    it 'raises error if new balance exceeds limit' do
      subject.top_up(Oystercard::MAX_LIMIT)
      expect{oystercard.top_up(1)}.to raise_error "You have exceeded the limit of #{Oystercard::LIMIT}"
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

    it { is_expected.to respond_to(:deduct).with(1).argument }
    it 'decrease balance' do
      oystercard.top_up(15)
      expect {oystercard.deduct 5 }.to change{oystercard.balance}.by -5
    end

  end



end
