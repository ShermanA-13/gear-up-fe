class UserFacade
  def self.create_user(data)
    json = UserService.create_user(data)
    User.new(json[:data])
  end

  def self.users
    json = UserService.users

    json[:data].map do |merchant_data|
      User.new(merchant_data)
    end
  end

  def self.user(data)
    json = UserService.user(data)

    User.new(json[:data])
  end
end
