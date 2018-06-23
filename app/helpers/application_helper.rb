module ApplicationHelper
  def title(*contents)
    unless contents.empty?
      content_for :title do
        (contents << "Ticketify").join(" - ")
      end
    end
  end
end
