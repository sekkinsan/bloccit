# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'

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
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

#create sponsoredposts
10.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: 99 #figure out price
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

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored posts created"
