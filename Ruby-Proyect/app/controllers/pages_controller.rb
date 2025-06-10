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
    @carrito = session[:carrito] || []
    @total = @carrito.sum { |p| p["precio"].to_f * p["cantidad"] }
    render :index
  end

  def agregar carrito
    session[:carrito] ||= []
    
    producto_id = params[:producto_id].to_i
    producto = products-find(producto_id)

    item = session[:carrito].find {|i| i{id} == producto_id}


    if item 
      item[:cantidad] += 1
    else
      session[:cantidad] << {
        id: producto_id,
        nombre: producto.nombre,
        precio: producto.precio,
        cantidad: 1
      }
      redirect_back fallback_location: root_path, notice: "El producto fue agregado al Carrito."
  end
end
