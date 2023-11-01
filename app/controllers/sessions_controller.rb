class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            redirect_to session_path(user.id)
        else
            flash.now[:danger] = 'Invalid email/password combination'
            puts "Authentication failed for email: #{params[:session][:email]}"
            render 'new'
        end
    end
def show
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end
end
