class ApplicationController < ActionController::Base
    def hello
        render html: "hello world it's nice to see you"
    end
end
