# class reader described
class Reader
  attr_accessor :id, :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @id = SecureRandom.uuid
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end
end
