class SezyumController < ApplicationController
  unloadable

  def index
    @proje = Project.find params[:proje_adi]
    @uyeler = @proje.users
  end
end
