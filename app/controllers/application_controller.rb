class ApplicationController < ActionController::Base
  include Pundit
  include NotAuthorizedConcern
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized   
end
