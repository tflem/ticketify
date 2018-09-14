module ApplicationHelper
  def title(*contents)
    unless contents.empty?
      content_for :title do
        (contents << "Ticketify").join(" - ")
      end
    end
  end

  def admins_only(&block)
    block.call if current_user.try(:admin)
  end
end
