class Error
  attr_reader :status, :message, :code

  def initialize(data)
    @status = data[0][:status]
    @message = data[0][:message]
    @code = data[0][:code]
  end
end
