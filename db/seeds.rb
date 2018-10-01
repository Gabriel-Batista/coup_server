# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.create(name: "Duke", ability: "Bank", block: "Foreign Aid", desc: "")          #1
Card.create(name: "Assassin", ability: "Assassinate", block: "", desc: "")         #2
Card.create(name: "Contessa", ability: "", block: "Assassinate", desc: "")         #3
Card.create(name: "Captain", ability: "Steal", block: "Steal", desc: "")            #4
Card.create(name: "Ambassador", ability: "Draw", block: "Steal", desc: "")          #5
Card.create(name: "Income", ability: "Income", block: "", desc: "")                 #6
Card.create(name: "Foreign Aid", ability: "Foreign Aid", block: "", desc: "")       #7
Card.create(name: "Coup", ability: "Coup", block: "", desc: "")                     #8


User.create(name: "Gabe", handL: 4, handR: 2)
User.create(name: "Amirata", handL: 6, handR: 2)
User.create(name: "Scarlet", handL: 1, handR: 5)
User.create(name: "Kevin", handL: 3, handR: 3)
User.create(name: "Bryan", handL: 1, handR: 5)

Match.create(completed: false, seats: 4, phase: "declare", turn: 1, declared: 1)

UserMatch.create(user_id: 1, match_id: 1)
UserMatch.create(user_id: 2, match_id: 1)
UserMatch.create(user_id: 3, match_id: 1)
UserMatch.create(user_id: 4, match_id: 1)