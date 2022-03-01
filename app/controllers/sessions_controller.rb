class SessionsController < ApplicationController
  def new
  end
  
  def create
    entered_email = params["email"]
    entered_password = params["password"]

    #checking the email
    @user = User.find_by({email: entered_email})
    
    
    if @user # yes, email matches
        #checking the password
        if BCrypt::Password.new(@user.password) == entered_password
            session["user_id"] = @user.id
            flash[:notice] = "Welcome!"
            redirect_to "/posts"
        else
            #password doesn't match, send back to the login page
            flash[:notice] = "Password doesn't match"
            redirect_to "/sessions/new"
        end
    else
        #email doesn't match, send back to the login page
        flash[:notice] = "Email doesn't exist"
        redirect_to "/sessions/new"
    end
  end

  def destroy
    session["user_id"] = nil
    flash[:notice] = "You have been logged out"
    redirect_to "/sessions/new"
  end
end
