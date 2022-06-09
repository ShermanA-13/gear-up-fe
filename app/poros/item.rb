class Item
  attr_reader :id, :name, :description, :count, :category, :user_id, :owner

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @count = data[:attributes][:count]
    @category = enum_category(data[:attributes][:category])
    @user_id = data[:attributes][:user_id]
    @owner = data[:attributes][:owner]
  end

  def enum_category(category_num)
    @@enums = [
      "Tents",
      "Sleeping Bag",
      "Stoves, Grills & Fuel",
      "Cookware",
      "Dishes",
      "Ropes",
      "Harnesses",
      "Belay & Rappel",
      "Crash Pads",
      "Quickdraws"
    ]
    @@enums[category_num.to_i]
  end

  def self.category_list
    [
      "Tents",
      "Sleeping Bag",
      "Stoves, Grills & Fuel",
      "Cookware",
      "Dishes",
      "Ropes",
      "Harnesses",
      "Belay & Rappel",
      "Crash Pads",
      "Quickdraws"
    ]
  end

  def is_present?(array)
    !array.select {|item| item.id == self.id}.empty?
  end
end
