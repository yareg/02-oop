# described library class - get output information
class Library
  attr_accessor :data_module
  def initialize(data_module)
    @data_module = data_module
  end

  def most_active_reader
    data_module.fetch_orders.group_by { |order| order.reader }.sort_by { |_, value| value.length }.to_a.last.first
  end

  def most_popular_book
    group_orders_by_books.last.first
  end

  def three_popular_books_orders
    books = group_orders_by_books.last(3).map { |item| item.first }
    book_ids = books.map { |book| book.id }

    readers = data_module.fetch_orders.map do |order|
      if book_ids.include? order.book.id
        order.reader
      else
        nil
      end
    end

    readers = readers.uniq.compact

    return books, readers
  end

  private

  def group_orders_by_books
    data_module.fetch_orders.group_by { |order| order.book }.sort_by { |_, value| value.length }.to_a
  end
end
