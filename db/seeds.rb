# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.create(name: "Duke", ability: "Bank", block: "Foreign Aid", imgURL: "https://ibb.co/eQeoSU", desc: "")
Card.create(name: "Assassin", ability: "Assassinate", block: nil, imgURL: "https://ibb.co/ha3n49", desc: "")
Card.create(name: "Contessa", ability: nil, block: "Assassinate", imgURL: "https://ibb.co/dT4GxU", desc: "")
Card.create(name: "Captain", ability: "Steal", block: "Steal", imgURL: "https://ibb.co/eSPcMp", desc: "")
Card.create(name: "Ambassador", ability: "Draw", block: "Steal", imgURL: "https://ibb.co/hSDRE9", desc: "")
Card.create(name: "Ambassador", ability: "Draw", block: "Steal", imgURL: "https://ibb.co/jXgcnU", desc: "")


User.create(name: "Gabe")
User.create(name: "Amirata")