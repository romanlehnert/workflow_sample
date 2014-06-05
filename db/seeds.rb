# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Applying Seeds from db/seeds.rb"
workflow_1 = Workflow.create! name: "default workflow"
puts "Created Default workflow"


state_1 = workflow_1.states.create!(name: :initialized, initial: true)
state_2 = workflow_1.states.create!(name: :in_progress)
state_3 = workflow_1.states.create!(name: :done)
puts "Created 3 states for default workflow"


transition_1 = Transition.create!(origin: state_1, target: state_2, name: "pick_up")
transition_2 = Transition.create!(origin: state_2, target: state_3, name: "finish")
transition_3 = Transition.create!(origin: state_3, target: state_1, name: "reject")
puts "Created 3 Transitions for default workflow"


#transition_1.conditions.create("Attributesdasd a")
#transition_1.conditions.create("asdasdad")
#transition_1.validation.create("Attributesdasd a")
#transition_1.post_hooks.create(hook: "Mailer", 
#                               params: { 
#                                          receiver: "subject.receiver", 
#                                          cc: "bla@asdasd.de", 
#                                          text: "Toll, dass du damit zu arbeiten anfängst" 
#                                        })
#
#
#
#
#transition_2 = Transition.create(origin: state_2, target: state_3, name: "finish")
#transition_3 = Transition.create(origin: state_3, target: state_1, name: "reject")
#
#
