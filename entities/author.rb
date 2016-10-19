# class author described
class Author
  attr_accessor :id, :name, :biography

  def initialize(name, biography)
    @id = SecureRandom.uuid
    @name = name
    @biography = biography
  end
end
