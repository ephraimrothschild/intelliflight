class Airport < ActiveRecord::Base
  def self.import_airports
    regexp = /"([a-zA-Z0-9]{3})","(.+): (.+)?"/
    File.open("/airports.txt", "r") do |f|
      f.each_line do |line|
        match = regexp.match(line)
        Airport.create(code: $1, city: $2, airport_name: $3)
      end
    end
  end

  def self.clear_unused_airports
    airports = []
    Airport.all.each do |airport|
      # if Flight.where()
      outbound = Flight.where(org_location_name: airport.city).count
      inbound = Flight.where(dest_location_name: airport.city).count
      if outbound + inbound == 0
        airports << airport
      end
    end
    for airport in airports
      airport.delete
    end
  end
end
