class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    entered_email = params["user"]["email"]
    @user = User.find_by({email: entered_email})
    
    if @user # yes, email matches
      flash[:notice] = "E-mail already taken. Please, log in instead."
      redirect_to "/users/new"
    else
      plain_text_password = params["user"]["password"]
      @user = User.new(params["user"])
      @user.password = BCrypt::Password.create(plain_text_password)
      @user.save
      redirect_to "/posts"
    end
  end
end
