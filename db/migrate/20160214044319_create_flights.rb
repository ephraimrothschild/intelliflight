require 'csv'

class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :departure_date
      t.string :carrier
      t.integer :flight_num
      t.integer :crs_dep_time
      t.integer :dep_time
      t.integer :delay
      t.integer :taxi_out
      t.integer :wheels_off
      t.integer :wheels_on
      t.integer :taxi_in
      t.integer :arr_time
      t.integer :arr_delay
      t.boolean :canceled
      t.integer :carrier_delay
      t.integer :weather_delay
      t.integer :security_delay

      t.string :org_location_name
      t.string :dest_location_name

      t.timestamps null: false
    end

    csv_text = File.read('/971753140_T_ONTIME_2.csv')
    csv = CSV.parse(csv_text, :headers => true)
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