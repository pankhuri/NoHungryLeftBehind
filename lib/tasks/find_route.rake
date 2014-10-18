namespace :db do

  desc 'Seed Routes Between Happiness Truck Location Stops'
  task :seed_routes => :environment do
    Location.all.reverse.each do |location|
      
      origin_location = location
      if origin_location.has_children?
        destination_location = origin_location.children.first
        origin_lat_long = {latitude: origin_location.latitude, longitude: origin_location.longitude}
        destination_lat_long = {latitude: destination_location.latitude, longitude: destination_location.longitude}
      
        route_file = CSV.open("public/routes.csv", "a")
      
        routes = Location.route_steps(origin_lat_long, destination_lat_long)
        route_file << [origin_location.name.concat(" - #{destination_location.name}")  , origin_location.latitude, origin_location.latitude , routes]
      else
        puts "No children of location :  #{origin_location.name} : #{origin_location.id}"
      end
      
    end

  end
end