class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    if session["user_id"]
      @current_user = User.find(session["user_id"])
    end
  end
end
