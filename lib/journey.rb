require 'oystercard'

class Journey


  attr_reader :journeys, :status, :entry_station, :exit_station

  MIN_LIMIT = 1
  PENALTY = 6
  def initialize
    @journeys = { entry_station: nil, exit_station: nil }
    @status = false
  end

  def starting(station)
    @status = true
    @journeys[:entry_station] = station
  end

  def finishing(station)
    @status = false
    @journeys[:exit_station] = station

  end

  def complete?
    entry_station.nil? || exit_station.nil? ? true : false
  end


  def fare
    complete? ? PENALTY : MIN_LIMIT
  end
end
