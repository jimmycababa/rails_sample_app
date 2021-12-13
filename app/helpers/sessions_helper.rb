module SessionsHelper

    # Logs in the given user
    def log_in(user)
        # defining log_in to correspond to the log_in from the sessions controller
        # the way to create the session is use the session method which we will treat like a hash
        # the session method puts a cookie on the browser(temporary cookie)
        session[:user_id] = user.id
    end

    # Remembers a user in a persistent session. we have endowed the user with a remember token
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # returns the current loggin-in user (if any)
    def current_user
        # we create the instance variable @current_user bc it hits the database the first time but returns the instance variable immediately on subsequent invocations.
        # @current_user is equal to the current user (if it exists) but if its nil then that's why we use the "or" operator. the commented out line below is a more readable version for a beginner, and the actual code that is read is best practices.
            # @current_user = @current_user || User.find_by(id: session[:user_id])
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    # returns true if the user is logged in, false otherwise
    def logged_in?
        # if the current user is not nil, then the user is logged in
        !current_user.nil?
    end

    # forgets a persistent session
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def log_out
        forget(current_user)
        reset_session
        @current_user = nil
    end
end
