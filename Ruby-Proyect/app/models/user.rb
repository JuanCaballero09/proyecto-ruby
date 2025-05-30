class User < ApplicationRecord
  #devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  #roles con enum
  enum :rol, { cliente: 0, empleado: 1, admin: 2 }

  #asignar valores por defecto al crear un nuevo usuario
  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.rol ||= ':cliente'
    self.activo ||= true if activo.nil?
    self.fecha_registro ||= Date.today
  end

  #validaciones
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :telefono, presence: true
end
