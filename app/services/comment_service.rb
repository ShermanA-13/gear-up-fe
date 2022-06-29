class CommentService < BaseService
  class << self
    # def comments_by_trip_id(trip_id)
    #   response = conn.get("/api/v1/trips/#{@trip.id}/#{@user.id}/comments")
    #   get_json(response)
    # end

    def create(parameters)
      # response = conn.post "/api/v1/users/#{parameters[:user_id]}/items", {
      #   name: (parameters[:name]).to_s,
      #   description: (parameters[:description]).to_s,
      #   count: (parameters[:count]).to_s,
      #   category: (parameters[:category]).to_s,
      #   user_id: (parameters[:user_id]).to_s
      }.to_json, "Content-Type" => "application/json"

       get_json(response)
    end

    def destroy(parameters)
      # response = conn.delete("/api/v1/users/#{parameters[:user_id]}/items/#{parameters[:id]}")
    end
  end
end
