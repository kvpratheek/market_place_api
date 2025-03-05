require("debug")
module Authenticable
  def get_current_user
    puts "Get current user called"
    return @current_user if @current_user
    header = request.headers["Authorization"]
    return nil if header.nil?
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id]) rescue ActiveRecord::RecordNotFound
  end
end