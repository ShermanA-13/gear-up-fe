class User
  attr_reader :id, :email, :first_name, :last_name

  def initialize(data)
    @id = data[:id]
    @email = data[:attributes][:email]
    @first_name = data[:attributes][:first_name]
    @last_name = data[:attributes][:last_name]
  end
end
