class User
  attr_reader :id, :first_name, :last_name, :email, :user_photo

  def initialize(data)
    @id = data[:id]
    @first_name = data[:attributes][:first_name]
    @last_name = data[:attributes][:last_name]
    @email = data[:attributes][:email]
    @user_photo = data[:attributes][:user_photo]
  end

  def on_trip?(trip)
    require "pry"; binding.pry
  end
end
