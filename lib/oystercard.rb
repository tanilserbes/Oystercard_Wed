class Oystercard
  attr_reader :balance, :in_journey
  LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    raise "You have exceeded the limit of #{Oystercard::LIMIT}" if @balance + money > LIMIT
    @balance += money
  end

  def deduct(ticket)
    @balance -= ticket
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
