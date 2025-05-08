class GruposController < ApplicationController
  def index
    @grupos = Grupo.all
  end

  def new
    @grupo = Grupo.new
  end

  def create
    @grupo = Grupo.new(grupo_params)
    if @grupo.save
      redirect_to grupos_path, 
      notice: "El grupo fue creado exitosamente."
    else
      render :new
  end
end

private
  def grupo_params
    params.require(:grupo).permit(:nombre)
  end
end
