# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create email: 'mary@example.com', password: 'guessit', password_confirmation: 'guessit'

Category.create [
  {name: 'Programming'},
  {name: 'Event'},
  {name: 'Travel'},
  {name: 'Music'},
  {name: 'TV'}
]

user.articles.create([
  {
    title: 'Advanced Active Record',
    body: "Models need to relate to each other. In the real world, ..",
    published_at: Date.today,
  },
  {
    title: 'One-to-many associations',
    body: "One-to-many associations describe a pattern ..",
    published_at: Date.today
  },
  {
    title: 'Associations',
    body: "Active Record makes working with associations easy..",
    published_at: Date.today
  },
])

