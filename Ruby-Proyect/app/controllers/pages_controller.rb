class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @seccion = params[:seccion] || "home"

    @grupos = Grupo.includes(:products)
  end

  def home
    @seccion = "home"
    render :index
  end

  def edit
    @seccion = "edit"
    @resource = current_user
    @resource_name = :user
    render :index
  end


  def carrito
    @seccion = "carrito"
    render :index
  end
end
