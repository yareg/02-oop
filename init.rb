require './require'

File.delete DataManipulation::STORAGE if File.exist? DataManipulation::STORAGE

authors_hash = {
  'Alexander Block': 'Russian writer',
  'Jack London': 'Cool writer',
  'Taras Shevchecnko': 'Our writer',
  'Alexandre Dumas': 'Author of The Count of Monte Cristo',
  'Herman Melville': 'Wrote Moby-Dick'
}
authors = []
authors_hash.each do |key, value|
  authors << Author.new(key.to_s, value)
end

DataManipulation.add_authors authors

books_hash = {
  'Alexander Block': ['Stranger'],
  'Jack London': ['Martin Eden', 'The Iron Heel', 'The Call of the Wild'],
  'Taras Shevchecnko': ['Kobzar'],
  'Alexandre Dumas': ['The Count of Monte Cristo', 'The Three Musketeers'],
  'Herman Melville': ['Moby-Dick']
}

authors = DataManipulation.fetch_authors

books = []
authors.each do |author|
  next unless books_hash.key? author.name.to_sym
  books_hash[author.name.to_sym].each do |book_name|
    books << Book.new(book_name, author)
  end
end
DataManipulation.add_books books

readers = []
readers_arr = [
  ['Fedor', 'fedor@yopmail.com', 'Kyiv', 'Bazhana', 115],
  ['Petro', 'petro@yopmail.com', 'Kharkiv', 'Shevchenka', 34],
  ['Semen', 'semen@yopmail.com', 'Kyiv', 'Obolonska', 56],
  ['Olga', 'olga@yopmail.com', 'Dnipro', 'Korolenko', 15],
  ['Maksim', 'maksim@yopmail.com', 'Dnipro', 'Fabra', 4],
  ['Svitlana', 'svtlana@yopmail.com', 'Lviv', 'Bandery', 39],
  ['Antonina', 'antonina@yopmail.com', 'Lviv', 'Chornovola', 100]
]
readers_arr.each do |reader|
  readers << Reader.new(reader[0], reader[1], reader[2], reader[3], reader[4])
end
DataManipulation.add_readers readers

orders = []
orders_arr = [
  { book: 'Martin Eden', reader: 'Olga' },
  { book: 'The Count of Monte Cristo', reader: 'Olga' },
  { book: 'Moby-Dick', reader: 'Semen' },
  { book: 'Kobzar', reader: 'Maksim' },
  { book: 'The Three Musketeers', reader: 'Olga' },
  { book: 'Kobzar', reader: 'Petro' },
  { book: 'Moby-Dick', reader: 'Olga' },
  { book: 'Kobzar', reader: 'Fedor' },
  { book: 'Stranger', reader: 'Svitlana' },
  { book: 'Martin Eden', reader: 'Svitlana' },
  { book: 'Kobzar', reader: 'Svitlana' },
  { book: 'The Iron Heel', reader: 'Antonina' }
]

orders_arr.each do |item|
  orders << Order.new(
    DataManipulation.fetch_book_by_name(item[:book]),
    DataManipulation.fetch_reader_by_name(item[:reader])
  )
end
DataManipulation.add_orders orders
