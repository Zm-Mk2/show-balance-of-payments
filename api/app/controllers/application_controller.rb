class ApplicationController < ActionController::API
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :null_session
    #protect_from_forgery with: :exception
end
