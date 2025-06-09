class PagesController < ApplicationController

  def index
    @seccion = params[:seccion] || "home"
    @grupos = Grupo.all
  end

  def home
    @seccion = "home"
    render :index
  end

  def productos
    @seccion = "productos"
    nombre_param = params[:nombre].tr("-", " ")
    @grupo = Grupo.find_by("LOWER(nombre) = ?", nombre_param.downcase)
    @productos = @grupo.products.where(disponible: true).order(id: :asc)
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
