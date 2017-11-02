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

  private

  def deduct
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @balance -= MINIMUM_FARE
  end

end
