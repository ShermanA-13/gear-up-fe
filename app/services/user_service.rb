class UserService < BaseService
  def self.create_user(data)
    conn.post("post", "{
      'first_name': #{data[:first_name]},
      'last_name': #{data[:last_name]},
      'email': #{data[:email]}}",
      "Content-Type" => "application/json")
  end

  def self.get_user(email)
    response = conn.get("/api/v1/users/#{email}")

    get_json(response)
  end
end
