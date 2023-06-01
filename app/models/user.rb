class User < Ohm::Model
  attribute :name
  index :name

  def json
    {
      id: id,
      name: name
    }
  end
end