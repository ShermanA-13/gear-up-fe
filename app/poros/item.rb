class Item
  attr_reader :id, :name, :description, :count, :category, :user_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @count = data[:attributes][:count]
    @category = data[:attributes][:category]
    @user_id = data[:attributes][:user_id]
  end
end
