# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@uttam_nagar     = PickUpLocation.create(name: "Uttam Nager West", city: "New Delhi")
@district_center = PickUpLocation.create(name: "Janakpuri District Center", parent_id: @uttam_nagar.id , city: "New Delhi")
@janakpuri       = DropLocation.create(name: "Janakpuri East Metro Station", parent_id: @district_center.id, city: "New Delhi")
@tilak           = PickUpLocation.create(name: "Tilak Nagar", parent_id: @janakpuri.id, city: "New Delhi")
@subhash         = PickUpLocation.create(name: "Subhash Nagar", parent_id: @tilak.id, city: "New Delhi")
@tagore          = DropLocation.create(name: "Tagore Garden", parent_id: @subhash.id, city: "New Delhi")
@rajori_garder   = PickUpLocation.create(name: "Rajori Garden", parent_id: @tagore.id, city: "New Delhi")
@ramesh          = PickUpLocation.create(name: "Ramesh Nagar", parent_id: @rajori_garder.id, city: "New Delhi")
@moti            = PickUpLocation.create(name: "Moti Nagar", parent_id: @ramesh.id, city: "New Delhi")
@kirti           = DropLocation.create(name: "Kirti Nagar", parent_id: @moti.id, city: "New Delhi")
@shadipur        = PickUpLocation.create(name: "Shadipur", parent_id: @kirti.id, city: "New Delhi")
@patel           = PickUpLocation.create(name: "Patel Nagar", parent_id: @shadipur.id, city: "New Delhi")
@rajendre        = PickUpLocation.create(name: "Rajendre Place", parent_id: @patel.id, city: "New Delhi")
@karol           = PickUpLocation.create(name: "Karol Baagh", parent_id: @rajendre.id, city: "New Delhi")
@jhandewalan     = DropLocation.create(name: "Jhandewalan", parent_id: @karol.id, city: "New Delhi")
@ramakrishna_ashram_marg = PickUpLocation.create(name: "Ramakrishna Ashram Marg", parent_id: @jhandewalan.id, city: "New Delhi")
@janpath = PickUpLocation.create(name: "Janpath", parent_id: @ramakrishna_ashram_marg.id, city: "New Delhi")
@tal_katora_stadium = PickUpLocation.create(name: "Talkatora Stadium", parent_id: @janpath.id, city: "New Delhi")
@patel_chowk_metro = DropLocation.create(name: "Patel Chowk Metro", parent_id: @tal_katora_stadium.id, city: "New Delhi")
@karnatka_bhawan = PickUpLocation.create(name: "Karnatka Bhawan", parent_id: @patel_chowk_metro.id, city: "New Delhi")
@dhaula_kuan = PickUpLocation.create(name: "Dhaula kuan", parent_id: @karnatka_bhawan.id, city: "New Delhi")
@gopi_nath_bazaar = PickUpLocation.create(name: "Gopi nath bazaar", parent_id: @dhaula_kuan.id, city: "New Delhi")
@nangal_village = DropLocation.create(name: "Nangal Village", parent_id: @gopi_nath_bazaar.id, city: "New Delhi")
@dabri = PickUpLocation.create(name: "Dabri", parent_id: @nangal_village.id, city: "New Delhi")
@sita_puri = PickUpLocation.create(name: "Sita puri", parent_id: @dabri.id, city: "New Delhi")
@asalatpur_village = DropLocation.create(name: "Asalatpur Village", parent_id: @sita_puri.id, city: "New Delhi")
