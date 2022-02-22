class ApplicationController < ActionController::Base
  # uncomment the following line to activate authentication features
  before_action :authenticate_user!
end
