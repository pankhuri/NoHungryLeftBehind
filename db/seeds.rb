# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@uttam_nagar     = PickUpLocation.create(name: "Uttam Nager")
@district_center = PickUpLocation.create(name: "District Center", parent_id: @uttam_nagar.id )
@janakpuri       = DropLocation.create(name: "Janakpuri East", parent_id: @district_center.id)
@tilak           = PickUpLocation.create(name: "Tilak Nagar", parent_id: @janakpuri.id)
@subhash         = PickUpLocation.create(name: "Subhash Nagar", parent_id: @tilak.id)
@tagore          = DropLocation.create(name: "Tagore Garden", parent_id: @subhash.id)
@rajori_garder   = PickUpLocation.create(name: "Rajori Garden", parent_id: @tagore.id)
@ramesh          = PickUpLocation.create(name: "Ramesh Nagar", parent_id: @rajori_garder.id)
@moti            = PickUpLocation.create(name: "Moti Nagar", parent_id: @ramesh.id)
@kirti           = DropLocation.create(name: "Kirti Nagar", parent_id: @moti.id)
@shadipur        = PickUpLocation.create(name: "Shadipur", parent_id: @kirti.id)
@patel           = PickUpLocation.create(name: "Patel Nagar", parent_id: @shadipur.id)
@rajendre        = PickUpLocation.create(name: "Rajendre Place", parent_id: @patel.id)
@karol           = PickUpLocation.create(name: "Karol Baagh", parent_id: @rajendre.id)
@jhandewalan     = DropLocation.create(name: "Jhandewalan", parent_id: @karol.id)
