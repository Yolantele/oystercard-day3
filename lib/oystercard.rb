require './lib/station.rb'
# This is a simulation of an Oystercard system
class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance#, :entry_station, :journey, :list_of_journeys

  def initialize(balance = 0)
    @balance = balance
    # @list_of_journeys = []
    # @journey = {}
  end

  def top_up(amount)
    raise error_top_up if @balance + amount > LIMIT
    @balance += amount
  end

  def error_top_up
    "This exceeds the card limit. You can top_up only #{LIMIT - @balance}"
  end

  # def touch_in(entry_station)
  #   raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
  #   # @entry_station = entry_station
  #   # @journey[entry_station]
  # end

  # def touch_out(exit_station)
  #   deduct if in_journey?
  #   @journey[@entry_station] = exit_station
  #   add_journey
  #   @entry_station = nil
  # end

  # def in_journey?
  #   @entry_station != nil
  # end
  def deduct
    #if journey_complete?
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @balance -= MINIMUM_FARE
  end

  private
  # def add_journey
  #   @list_of_journeys << @journey
  #   @journey = {}
  # end
end
