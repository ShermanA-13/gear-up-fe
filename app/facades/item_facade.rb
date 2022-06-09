class ItemFacade
  class << self
    def find_item(user_id, item_id)
      data = ItemService.find_item(user_id, item_id)[:data]
      Item.new(data)
    end

    def items(user_id)
      ItemService.items(user_id)[:data].map do |data|
        Item.new(data)
      end
    end

    def create(parameters)
      json = ItemService.create(parameters)
      Item.new(json[:data])
    end

    def destroy(parameters)
      ItemService.destroy(parameters)
    end

    def update(parameters)
      json = ItemService.update(parameters)
      Item.new(json[:data])
    end

    def trip_items(user_id, trip_id)
      json = ItemService.find_trip_items(user_id, trip_id)
      json[:data].map {|data| Item.new(data)}
    end
  end
end
