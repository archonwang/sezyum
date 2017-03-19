class SezyumController < ApplicationController
  unloadable

  def index
    @project = Project.find params[:project_id]
    @members = @project.users
  end
end
