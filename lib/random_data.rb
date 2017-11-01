#define RandomData as a module because it is a standalone library
module RandomData

  #define random name
  def self.random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  #define random email
  def self.random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end

  #define random_paragraph, set sentences to an array and create 4~6 random sentences and append them
  #call join on sentences to combine each sentence in the array into a full paragraph (as a string)
  def self.random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end

    sentences.join(" ")
  end

  #same as above to create sentences with random number of words
  #we then call capitalize on it and add a period, which returns a copy with the first letter of each sentence cap
  def self.random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end

    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  #same as above to make random words
  #shuffle! is used instead of shuffle to shuffle the letters in place
  #we join the zeroth through nth item in letters
  def self.random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0,rand(3..8)].join
  end
end
