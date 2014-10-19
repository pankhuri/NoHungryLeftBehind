namespace :db do

  desc 'Seed Routes Between Happiness Truck Location Stops'
  task :seed_routes => :environment do
    @locations = Location.all
    #route_file = CSV.open("public/directions.json", "a")
    @route_json = [] 
    @locations.each_with_index do |location, index|
      origin = location
      @route_json << {"latitude" => origin.latitude, "longitude" => origin.longitude, "#{location.class.to_s.camelize}" => true}
      if origin.has_children?
        destination = origin.children.first
        routes = Location.route_steps(origin, destination)
        puts origin.name.concat(" - #{destination.name}") + "  : #{routes.size} "
        routes.each { |step| @route_json << {"latitude" => step["lat"], "longitude" => step["lng"]} } 
        #route_file << [origin.name.concat(" - #{destination.name}")  , [origin.latitude, origin.longitude], [destination.latitude, destination.longitude] , routes.to_json]
      elsif location.id == @locations.last.id
        destination = Location.first
        routes = Location.route_steps(origin, destination)
        puts origin.name.concat(" - #{destination.name}") + "  : #{routes.size} "
         routes.each { |step| @route_json << {"latitude" => step["lat"], "longitude" => step["lng"]} } 
        #route_file << [origin.name.concat(" - #{destination.name}")  , [origin.latitude, origin.longitude], [destination.latitude, destination.longitude] , routes.to_json]
      else
        puts "No children of location :  #{origin.name} : #{origin.id}"
      end
      
    end
        
    File.open("public/directions.json","w") do |f|
        f.write(@route_json.to_json)
      end 
      
  end
end