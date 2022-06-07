class UserService < BaseService
  class << self
    def create_user(data)
      response = conn.post '/api/v1/users', {
          first_name: "#{data[:first_name]}",
          last_name: "#{data[:last_name]}",
          email: "#{data[:email]}",
          user_photo: "#{data[:user_photo]}"
        }.to_json, "Content-Type" => "application/json"
        # binding.pry
      get_json(response)
    end

    def user(id)
      response = conn.get("/api/v1/users/#{id}")
      get_json(response)
    end

    def users
      response = conn.get("/api/v1/users")
      get_json(response)
    end
  end
end
