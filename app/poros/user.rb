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
    trip.users.any? { |user| user.id == id.to_i }
  end

  def host?(trip)
    trip.host == first_name
  end
end
