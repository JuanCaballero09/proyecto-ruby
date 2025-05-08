class PagesController < ApplicationController
  
  def index
    @seccion = params[:seccion] || "home"
  end
  
  def home
    @seccion = "home"
    render :index
  end

  def dashboard
  end

  def menu
    @seccion = "menu"
    render :index
  end

  def carrito
    @seccion = "carrito"
    render :index
  end
  
end
