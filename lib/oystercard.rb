# This is a simulation of an Oystercard system
class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    raise error_top_up if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @entry_station = entry_station
  end

  def touch_out
    deduct if in_journey?
    @entry_station = nil
  end

  def in_journey?
    @entry_station != nil
  end

  def error_top_up
    "This exceeds the card limit. You can top_up only #{LIMIT - @balance}"
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
