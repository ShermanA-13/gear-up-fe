class User
  attr_reader :id, :first_name, :last_name, :email

  def initialize(data)
    @id = data[:id]
    @first_name = data[:attributes][:first_name]
    @last_name = data[:attributes][:last_name]
    @email = data[:attributes][:email]
  end
end
