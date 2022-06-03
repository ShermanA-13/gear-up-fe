class User
  attr_reader :id,
    :email

  def initialize(data)
    @id = data[:id]
    @email = data[:attributes][:email]
  end
end
