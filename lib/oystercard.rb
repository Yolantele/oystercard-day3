# This is a simulation of an Oystercard system
class Oystercard
  LIMIT = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :state

  def initialize(balance = 0)
    @balance = balance
    @state = :not_in_use
  end

  def top_up(amount)
    raise error_top_up if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @state = :in_use
  end

  def touch_out
    deduct if @state == :in_use
    @state = :not_in_use
  end

  def in_journey?
    @state == :in_use
  end

  def error_top_up
    "This exceeds the card limit. You can top_up only #{LIMIT - @balance}"
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
