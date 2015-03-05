class SessionsController < ApplicationController
	def new
  	end

  	def create
    	user = User.authenticate(params[:email], params[:password])
    	puts YAML::dump(user)
    	if user
	    	session[:user_id] = user.id
    		redirect_to '/items', :notice => "Logged in!"
    	else
      		flash.now.alert = "Invalid email or password"
      		render 'sessions/new'
    	end
  	end

	def destroy
  		session[:user_id] = nil
  		redirect_to root_url, :notice => "Logged out!"
	end

end
