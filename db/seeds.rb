# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'jjoyce1@me.com', username: 'jjoyce1', password: 'password', faculty: true)
User.create!(email: 'johnny@jonathan.com', username: 'johnnycoolshades', password: 'password', faculty: false)
User.create!(email: 'jjoyce2@me.com', username: 'jjoyce2', password: 'password', faculty: false)

Category.create!(name: "Science")
Proposal.create!(title: "Science stuff", hypothesis: "I think science is scienterrific!", status: "open", summary: "Find out if it truly is", faculty_id: 1, topic_id: 1)
Proposal.create!(title: "MORE SCIENCE PLEASE stuff", hypothesis: "I think science is scienterrific!", status: "closed", summary: "Find out if it truly is", faculty_id: 1, topic_id: 1)

Experiment.create!(staffer_id: 2, proposal_id: 1, title: "Finding out if science is cool", results: "Inconclusive", conclusion: "I don't know man", procedure: "Do shit idk")
