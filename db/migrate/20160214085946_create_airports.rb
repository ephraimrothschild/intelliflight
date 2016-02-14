class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.string :city
      t.string :airport_name
      t.timestamps null: false
    end

    regexp = /"([a-zA-Z0-9]{3})","(.+): (.+)?"/
    File.open("C:/Users/Ephraim/Downloads/airports.txt", "r") do |f|
      f.each_line do |line|
        match = regexp.match(line)
        Airport.create(code: $1, city: $2, airport_name: $3)
      end
    end
  end
end
