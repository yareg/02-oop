# class book described
class Book
  attr_accessor :id, :title, :author

  def initialize(title, author)
    @id = SecureRandom.uuid
    @title = title
    @author = author
  end
end
