# class order described
class Order
  attr_accessor :id, :book, :reader, :date
  include Common

  def initialize(book, reader)
    @id = SecureRandom.uuid
    @book = book
    @reader = reader
    @date = Common.format_time
  end
end
