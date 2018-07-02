class TicketsController < ApplicationController

    def new
      @ticket = @project.tickets.build
    end
end
