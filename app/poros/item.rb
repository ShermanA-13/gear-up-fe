class Item
  attr_reader :id, :name, :description, :category, :user_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @category = data[:attributes][:category]
    @user_id = data[:attributes][:user_id]
  end
end
