require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey

  MAX_LIMIT = 90
  MIN_LIMIT = 1
  def initialize
    @balance = 0
    @journey =  Journey.new
  end

  def top_up(money)
    raise "You have exceeded the limit of #{Oystercard::MAX_LIMIT}" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def touch_in(station)
    raise 'You have insufficient credit' if @balance < MIN_LIMIT
    journey.starting(station)
  end

  def touch_out(station)
    deduct(MIN_LIMIT)
    journey.finishing(station)
  end

  private
  def deduct(ticket)
    @balance -= ticket
  end

end
