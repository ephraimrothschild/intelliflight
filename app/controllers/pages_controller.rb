class PagesController < ApplicationController
  def find_flight
    origin = params["origin"]
    dest = params["destination"]
    date = Date.parse(params["date"])

    flights = Flight.where(org_location_name: origin, dest_location_name: dest, departure_date: (date - 13.months - 7.days)...(date + 7.days))
    delay_hash = {}
    for flight in flights
      carrier = flight.carrier
      delay_hash[carrier] = [] unless delay_hash.has_key? carrier
      delay_hash[carrier] << ((flight.arr_delay.nil?) ? 0 : flight.arr_delay)
    end

    median_hash = {}
    for hash_key in delay_hash.keys
      median_hash[hash_key] = median(delay_hash[hash_key])
    end
    @sorted_median = median_hash.sort_by{|k, v| v}

  end

  private
  def median(ary)
    mid = ary.length / 2
    sorted = ary.sort
    ary.length.odd? ? sorted[mid] : 0.5 * (sorted[mid] + sorted[mid - 1])
  end
end
