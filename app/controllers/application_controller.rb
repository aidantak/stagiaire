# frozen_string_literal: true

# ApplicationController is the base controller for all controllers in the application.
# It provides common methods and functionality that are shared across multiple controllers.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(_resource)
    authenticated_root_path
  end

  def after_sign_up_path_for(_resource)
    authenticated_root_path
  end
end
