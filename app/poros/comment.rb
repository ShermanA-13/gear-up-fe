class Comment
  attr_reader :id,
              :user_name,
              :user_id,
              :user_photo,
              :created_at,
              :message

  def initialize(data)
    @id = data[:id]
    @user_name = data[:attributes][:user_name]
    @user_id = data[:attributes][:user_id]
    @user_photo = data[:attributes][:user_photo]
    @created_at = timestamp(data)
    @message = data[:attributes][:message]
  end

  def timestamp(data)
    raw_date = DateTime.parse(data[:attributes][:created_at])
    timestamp = raw_date.strftime('%r on %b %e, %Y')
  end
end
