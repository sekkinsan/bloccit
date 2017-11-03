# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'


#create Users

5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

#create Topics
15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

#create Posts
50.times do
  #use create! (! = bang) with a bang which instructs the method to raise an error if there's a problem
  Post.create!(
  #use methods from a class that doesn't exist yet, RandomData, that will create random strings
  #this is called wishful coding and allows us to focus on one problem at a time
    user: users.sample,
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

#Create Comments
#we call times on an Integer to run the given block the specified number of times
#end result is similar to that of a loop, but in this use-case, it is easier to read
100.times do
  Comment.create!(
  #we call sample on the array returned by Post.all, in order to pick a random post to associate each comment.
  #sample returns a random element from the array every time it's called
  user: users.sample,
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

#create unique posts using ruby find_or_create_by
Post.find_or_create_by(title: 'Meow', body: 'Meeeeeow')

100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved:false
  )
end

#ADMIN USER
admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

#MEMBER USER
member = User.create!(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
