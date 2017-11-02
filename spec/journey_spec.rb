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

    it 'remembers the entry station' do
      subject.touch_in('Aldgate East')
      expect(subject.entry_station).to eq 'Aldgate East'
    end
  end

  describe ' #fare' do
    it ' should calculate the fare' do
      subject.touch_in('A')
      subject.touch_out('B')
      expect(subject.fare).to eq 1
    end
    it 'should charge penalty' do
      journey = [{ 'A' => nil }]
      expect(subject.fare).to eq 6
    end

  end

  describe ' #touch_out' do
    it 'should change in_journey to false' do
      touch_in_out
      expect(subject.in_journey?).to eq false
    end

    it 'should set exit station to station name' do
      touch_in_out
      expect(subject.end_journey?).to_not be nil
    end

    it 'should set entry station to nil' do
      touch_in_out
      expect(subject.entry_station).to eq nil
    end
  end

  describe '#in_journey?' do
    it 'Check if the card is in use or not.' do
      subject.touch_in('A')
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
