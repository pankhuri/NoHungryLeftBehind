# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@uttam_nagar     = PickUpLocation.create(name: "Uttam Nager West")
@district_center = PickUpLocation.create(name: "Janakpuri District Center", parent_id: @uttam_nagar.id )
@janakpuri       = DropLocation.create(name: "Janakpuri East Metro Station", parent_id: @district_center.id)
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
@ramakrishna_ashram_marg = PickUpLocation.create(name: "Ramakrishna Ashram Marg", parent_id: @jhandewalan.id)
@janpath = PickUpLocation.create(name: "Janpath", parent_id: @ramakrishna_ashram_marg.id)
@tal_katora_stadium = PickUpLocation.create(name: "Talkatora Stadium", parent_id: @janpath.id)
@patel_chowk_metro = DropLocation.create(name: "Patel Chowk Metro", parent_id: @tal_katora_stadium.id)
@karnatka_bhawan = PickUpLocation.create(name: "Karnatka Bhawan", parent_id: @patel_chowk_metro.id)
@dhaula_kuan = PickUpLocation.create(name: "Dhaula kuan", parent_id: @karnatka_bhawan.id)
@gopi_nath_bazaar = PickUpLocation.create(name: "Gopi nath bazaar", parent_id: @dhaula_kuan.id)
@nangal_village = DropLocation.create(name: "Nangal Village", parent_id: @gopi_nath_bazaar.id)
@dabri = PickUpLocation.create(name: "Dabri", parent_id: @nangal_village.id)
@sita_puri = PickUpLocation.create(name: "Sita puri", parent_id: @dabri.id)
@asalatpur_village = DropLocation.create(name: "Asalatpur Village", parent_id: @sita_puri.id)
Location.update_all(:city => "New Delhi")



