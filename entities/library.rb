# described library class - get output information
class Library
  attr_accessor :data_module
  def initialize(data_module)
    @data_module = data_module
  end

  def most_active_reader
    data_module.fetch_orders.group_by(&:reader).sort_by { |_, value| value.length }.to_a.last.first
  end

  def most_popular_book
    group_orders_by_books.last.first
  end

  def three_popular_books_readers_count
    book_ids = group_orders_by_books.last(3).map(&:first).map(&:id)
    data_module.fetch_orders.select { |order| book_ids.include? order.book.id }.map(&:reader).uniq.compact.length
  end

  private

  def group_orders_by_books
    data_module.fetch_orders.group_by(&:book).sort_by { |_, value| value.length }.to_a
  end
end
