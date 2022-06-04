class UserFacade
  class << self
    def create_user(data)
      json = UserService.create_user(data)
      User.new(json[:data])
    end

    def user(id)
      json = UserService.user(id)
      User.new(json[:data])
    end

    def users
      UserService.users[:data].map do |data|
        User.new(data)
      end
    end
  end
end
