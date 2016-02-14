require 'csv'

class Flight < ActiveRecord::Base
  def self.import_csv_flight_data
    csv_text = File.read('C:/Users/Ephraim/Downloads/971753140_T_ONTIME_3.csv')
    csv = CSV.parse(csv_text, :headers => true)
    puts "Started importing data..."
    csv.each do |r|
      Flight.create!(
          departure_date: r["FL_DATE"],
          carrier: r["CARRIER"],
          flight_num: r["FL_NUM"],
          crs_dep_time: r["CRS_DEP_TIME"],
          dep_time: r["DEP_TIME"],
          taxi_out: r["TAXI_OUT"],
          wheels_off: r["WHEELS_OFF"],
          wheels_on: r["WHEELS_ON"],
          taxi_in: r["TAXI_IN"],
          arr_time: r["ARR_TIME"],
          arr_delay: r["ARR_DELAY"],
          canceled: r["CANCELED"],
          carrier_delay: r["CARRIER_DELAY"],
          weather_delay: r["WEATHER_DELAY"],
          security_delay: r["SECURITY_DELAY"],
          org_location_name: r["ORIGIN_CITY_NAME"],
          dest_location_name: r["DEST_CITY_NAME"]
      )
    end
  end
end
