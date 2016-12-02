require './require'
require './entities/library'

library = Library.new DataManipulation

reader =  library.most_active_reader
puts 'Often takes books:'
puts '-- Name: ' + reader.name
puts '-- E-mail: ' + reader.email
puts '-- City: ' + reader.city
puts '-- Street: ' + reader.street
puts '-- House: ' + reader.house.to_s

book = library.most_popular_book
puts '**********************'
puts 'Most popular book:'
puts '-- Title: ' + book.title
puts '-- Author:'
puts '---- name: ' + book.author.name
puts '---- biography: ' + book.author.biography

puts '**********************'
puts "Amount of people, who ordered one of the three most popular books: #{library.three_popular_books_readers_count}"
