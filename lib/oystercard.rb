class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    raise "You have exceeded the limit of #{Oystercard::LIMIT}" if @balance + money > LIMIT
    @balance += money
  end
end
