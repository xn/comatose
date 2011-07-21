# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Comatose::Page.create_versioned_table
puts "Creating the default 'Home Page'..."
Comatose::Page.create( :title=>'Home Page', :body=>"h1. Welcome\n\nYour content goes here...", :author=>'System' )
