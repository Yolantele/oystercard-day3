require './lib/journey.rb'
# RSpec test file for Journey Class implementation code
describe Journey do
  subject(:journey) { described_class.new }
  let(:station) { double :station}

  def touch_in_out
    subject.touch_in(:station)
    subject.touch_out(:station)
  end

  describe '#touch_in' do
    it 'should change in journey to true' do
      subject.touch_in('A')
      expect(subject.in_journey?).to eq true
    end

    # it 'raises error if balance is less than minimum' do
    #   message = 'Insufficient balance for travel'
    #   expect { subject.touch_in(:station) }.to raise_error(message)
    # end

    it 'remembers the enrty station' do
      subject.touch_in('Aldgate East')
      expect(subject.entry_station).to eq 'Aldgate East'
    end
  end

  describe ' #fare' do
    context 'journey complete (end_journey?)' do
      it ' should calculate the fare' do
        touch_in_out
        expect(subject.fare(journey)).to eq 1
      end
      it 'should charge 6 times the minimum fare amount' do
        journey = [{ 'A' => 'A' }]
        expect(subject.fare(journey)).to eq 6
      end
    end
    context 'journey not complete (in_journey?)' do
      it 'should fail if journey is not complete' do
        subject.touch_in('A')
        message = 'Unable to calculate fare while journey is not complete'
        expect { subject.fare(journey)}.to raise_error(message)
      end
    end
  end

  describe ' #touch_out' do
    it 'should change in_journey to false' do
      # in_out
      touch_in_out
      expect(subject.in_journey?).to eq false
    end

    it 'should set exit station to station name' do
      touch_in_out
      expect(subject.end_journey?).to_not be nil
    end
    # it 'check if touch_out reduce balance by minumum fare' do
    #   in_out
    #   expect(topped_up_card.balance).to eq(4)
    # end

    it 'should set entry station to nil' do
      touch_in_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#in_journey?' do
    it 'Check if the card is in use or not.' do
      subject.touch_in('A')# top_and_in
      expect(subject.in_journey?).to eq(true)
    end
  end

  describe '#list_of_journeys' do
    it 'should store a list of journeys' do
      subject.touch_in('A')
      subject.touch_out('B')
      subject.touch_in('C')
      subject.touch_out('D')
      expected_hash = [{ 'A' => 'B' }, { 'C' => 'D' }]
      expect(subject.list_of_journeys).to eq(expected_hash)
    end
  end
end
