class ApplicationController < ActionController::Base
  # uncomment the following line to activate authentication features
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # ^ You have to say the word "authorize" somewhere in the controller action
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # ^ Only on index action, you have to say the word "policy_scope" somewhere in the controller action

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
