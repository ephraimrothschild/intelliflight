class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.string :city
      t.string :airport_name
      t.timestamps null: false
    end

    regexp = /"([a-zA-Z0-9]{3})","(.+): (.+)?"/
    File.open("/airports.txt", "r") do |f|
      f.each_line do |line|
        match = regexp.match(line)
        a = Airport.new(code: $1, city: $2, airport_name: $3)
        outbound = Flight.where(org_location_name: a.city).count
        inbound = Flight.where(dest_location_name: a.city).count
        if outbound + inbound > 0
          a.save!
        end
      end
    end
  end
end
