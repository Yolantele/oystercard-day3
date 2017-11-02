require './lib/station'
# This is a simulation of Journey class for Oyster card
class Journey
  attr_reader :entry_station, :exit_station, :journey, :list_of_journeys

  def initialize#(entry_station)
    @list_of_journeys = []
    @journey = {}
  end

  def touch_in(entry_station)
    # raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    # unless journey_comlete?
    @entry_station = entry_station
    @journey[entry_station]
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out(exit_station)
    @journey[@entry_station] = exit_station
    add_journey
    @entry_station = nil
    end_journey?#deduct if in_journey?
    # send message to to Card.deduct (activate)
  end

  def end_journey?
    @exit_station != nil unless in_journey?
  end

  def calculate_fare
    raise 'Journey not complete' if  in_journey?
    4
  end

    private

    def add_journey
      @list_of_journeys << @journey
      @journey = {}
    end

end
