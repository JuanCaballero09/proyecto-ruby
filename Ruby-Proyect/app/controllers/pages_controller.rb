class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @seccion = params[:seccion] || "home"
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

  def menu
    @seccion = "menu"
    @grupos = Grupo.includes(:products)
    render :index
  end

  def carrito
    @seccion = "carrito"
    render :index
  end
end
