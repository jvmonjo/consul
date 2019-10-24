class Tracking::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :verify_tracker

  skip_authorization_check

  private

    def verify_tracker
      raise CanCan::AccessDenied unless current_user&.tracker? || current_user&.administrator?
    end
end
