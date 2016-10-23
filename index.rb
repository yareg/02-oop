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

books, readers = library.three_popular_books_orders

puts '**********************'
puts 'Three most popular books:'
books.each do |popular_book|
  puts '-- Title: ' + popular_book.title
  puts '-- Author: ' + popular_book.author.name
  puts ''
end
puts '**********************'
puts 'People, who ordered al least one of these books:'
readers.each do |book_reader|
  puts '-- Name: ' + book_reader.name
  puts '-- E-mail: ' + book_reader.email
  puts '-- City: ' + book_reader.city
  puts '-- Street: ' + book_reader.street
  puts '-- House: ' + book_reader.house.to_s
  puts ''
end
