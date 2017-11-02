require './lib/journeylog.rb'
#Rspec test for journeylog.rb
describe JourneyLog do

  subject(:journeylog) { described_class.new }
  let(:journey) { double :journey}
  #
  # describe 'initialize' do
  #   it 'comes with added journey' do
  #     subject.new('A')
  #     expect(subject.add_journey).to eq('A')
  #   end
  # end
  #
  # describe '#start' do
  #   it 'should start a new journey with entry station' do
  #     expect(subject.start(entry_station)).to eq('Entry Station')
  #   end
  # end

end
