require './lib/station'
# This is a simulation of Journey class for Oyster card
class Journey
  attr_reader :entry_station, :exit_station, :journey, :list_of_journeys

  MINIMUM_FARE = 1

  def initialize
    @list_of_journeys = []
    @journey = {}
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    @journey[@entry_station]
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_out(exit_station)
    if exit_station == @entry_station
      @journey[@entry_station] = nil
    else
      #@exit_station = exit_station
      @journey[@entry_station] = exit_station
    end
    # @journey[@entry_station] = nil if exit_station == @entry_station
    # @journey[@entry_station] = exit_station
    fare
    add_journey
    reset_journey
  end

  def end_journey?
    @journey[@entry_station] != nil
  end

  def reset_journey
    @entry_station = nil
    @journey[@entry_station] = nil
  end

  def penalty
    6 * MINIMUM_FARE
  end

  def fare
    @entry_station && @journey[@entry_station] ? MINIMUM_FARE : penalty
  end

  private

  def add_journey
    @list_of_journeys << @journey
    @journey = {}
  end
end
