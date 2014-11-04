# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Candidate.create(name: 'Kay Hagan', party: "democrat")
Candidate.create(name: 'Thom Tillis', party: "republican")

Voter.create(name: 'Theodore Roosevelt', party: "bull-moose")
Voter.create(name: 'Millard Fillmore', party: "know-nothing")