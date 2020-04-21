class Oystercard
  attr_reader :balance, :in_journey
  MAX_LIMIT = 90
  MIN_LIMIT = 1
  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    raise "You have exceeded the limit of #{Oystercard::MAX_LIMIT}" if @balance + money > MAX_LIMIT
    @balance += money
  end

  def deduct(ticket)
    @balance -= ticket
  end

  def touch_in
    raise 'You have insufficient credit' if @balance < MIN_LIMIT
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
