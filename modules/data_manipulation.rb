# functions for reading/saving library data
module DataManipulation
  STORAGE = 'library.yml'.freeze

  def add_authors(authors)
    add_data(authors, :authors)
  end

  def add_books(books)
    add_data(books, :books)
  end

  def add_orders(orders)
    add_data(orders, :orders)
  end

  def add_readers(readers)
    add_data(readers, :readers)
  end

  def fetch_authors
    fetch_data :authors
  end

  def fetch_books
    fetch_data :books
  end

  def fetch_orders
    fetch_data :orders
  end

  def fetch_readers
    fetch_data :readers
  end

  def fetch_book_by_name(book_name)
    fetch_item_by_name(book_name, 'title', :books)
  end

  def fetch_reader_by_name(reader_name)
    fetch_item_by_name(reader_name, 'name', :readers)
  end

  private

  def add_data(data, key)
    data = [data] unless data.is_a? Array
    load_data unless defined? @storage_data
    @storage_data[key] = @storage_data[key].concat data
    write_data(@storage_data)
  end

  def load_data
    no_data = { authors: [], books: [], orders: [], readers: [] }
    @storage_data = File.file?(STORAGE) ? (YAML.load_file(STORAGE) || no_data) : no_data
  end

  def fetch_data(key)
    load_data unless defined? @storage_data
    @storage_data[key]
  end

  def fetch_item_by_name(value, compare_field, key)
    @storage_data[key].each do |item|
      return item if item.public_send(compare_field) == value
    end
    raise "Couldn't find #{key} with #{compare_field} == #{value}"
  end

  def write_data(data)
    File.open(STORAGE, 'w') { |f| f.write(data.to_yaml) }
  end
end
