# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'jjoyce1@me.com', username: 'jjoyce1', password: 'password', faculty: true)


Category.create!(name: "Risk Perception")
Category.create!(name: "Risky and Nonrisky decisions")
Category.create!(name: "Heuristics")
Category.create!(name: "Numeracy")
Category.create!(name: "Predictive Models and Optimization")
Category.create!(name: "Neuroeconomics")
Category.create!(name: "Experimental Economics")
Category.create!(name: "Probability Theory")
Category.create!(name: "Game Theory")


i = 1
while i < 10
  User.create!(email: "email"+ i.to_s + "@aol.com", username: 'user' + i.to_s, password: 'password', faculty: true)

  User.create!(email: "jjoyce"+ i.to_s + "@me.com", username: 'jjoyce' + i.to_s, password: 'password', faculty: false)

  Proposal.create!(title: Faker::Lorem.sentence, hypothesis: Faker::Lorem.paragraph, active: true, summary: Faker::Lorem.paragraph, faculty_id: i, category_id: i)

  Experiment.create!(staffer_id: i, proposal_id: 1, title: "Finding out if science is cool", results: "Inconclusive", conclusion: "I don't know man", procedure: "Do shit idk")
  10.times { Observation.create!(experiment_id: i, body: Faker::Lorem.paragraph) }
  i += 1
en
