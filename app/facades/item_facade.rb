class ItemFacade
  class << self
    def find_item(user_id, item_id)
      json = ItemService.find_item(user_id, item_id)
      if json[:errors].present?
        Error.new(json[:errors])
      else
        Item.new(json[:data] || json[:errors])
      end
    end

    def items(user_id)
      json = ItemService.items(user_id)
      if json[:data]
        json[:data].map do |data|
          Item.new(data)
        end
      else
        Error.new(json[:errors])
      end
    end

    def create(parameters)
      json = ItemService.create(parameters)
      if json[:errors].present?
        Error.new(json[:errors])
      else
        Item.new(json[:data])
      end
    end

    def destroy(parameters)
      ItemService.destroy(parameters)
    end

    def update(parameters)
      json = ItemService.update(parameters)
      if json[:errors].present?
        Error.new(json[:errors])
      else
        Item.new(json[:data])
      end
    end

    def trip_items(user_id, trip_id)
      json = ItemService.find_trip_items(user_id, trip_id)
      json[:data].map { |data| Item.new(data) }
    end
  end
end
