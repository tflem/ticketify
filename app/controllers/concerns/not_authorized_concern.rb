module NotAuthorizedConcern
  extend ActiveSupport::Concern

  private

  def not_authorized
    flash[:alert] = "You are not allowed to do that."
    redirect_to root_path
  end
end