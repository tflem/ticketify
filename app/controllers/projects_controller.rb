class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      flash[:notice] = "The project has been created."
      redirect_to @project
    else
      # notta yet
    end
end
