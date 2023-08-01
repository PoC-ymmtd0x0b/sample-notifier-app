# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {
    name: 'alice',
    email: 'alice@example.com',
    password: 'password'
  },
  {
    name: 'bob',
    email: 'bob@example.com',
    password: 'password'
  },
  {
    name: 'carol',
    email: 'carol@example.com',
    password: 'password'
  }
]

users.each do |user|
  User.create!(
    name: user[:name],
    email: user[:email],
    password: user[:password]
  )
end


practices = [
  {
    title: 'HTMLの書き方を学ぶ',
    description: 'HTMLの書き方を学びます'
  },
  {
    title: 'CSS入門',
    description: 'CSSでHTMLを装飾しよう'
  },
  {
    title: 'Ruby初級',
    description: 'プログラミング言語『Ruby』の基本を学びます'
  }
]

practices.each_with_index do |practice, index|
  Practice.create!(
    title: practice[:title],
    description: practice[:description],
    position: index + 1
  )
end
