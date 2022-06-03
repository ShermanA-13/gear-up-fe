class UserService < BaseService
  def self.create_user(data)
    response = conn.post("/api/v1/users", "{
      'first_name': #{data[:first_name]},
      'last_name': #{data[:last_name]},
      'email': #{data[:email]}}",
      "Content-Type" => "application/json")

    get_json(response)
  end

  def self.user(email)
    response = conn.get("/api/v1/users/#{email}")

    get_json(response)
  end
end
