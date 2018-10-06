class AddAttachmentToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :attachment, :string
  end
end
