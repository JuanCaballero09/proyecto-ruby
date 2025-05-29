Grupo.destroy_all
User.destroy_all
Product.destroy_all


ActiveRecord::Base.connection.reset_pk_sequence!('grupos')

puts "creando grupos"
Grupo.create(nombre: "Hamburguesa")
Grupo.create(nombre: "Pizza")
Grupo.create(nombre: "Salchipapa")
puts "Grupos creados #{Grupo.count}"

ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts "creando usuarios"
User.create(
  email: "admin@admin",
  password: "rasdix-jePjor-kohsy6",
  nombre: "Admin",
  apellido: "Admin",
  telefono: "123456789",
  rol: :admin
)

puts "Usuarios creados #{User.count}"


ActiveRecord::Base.connection.reset_pk_sequence!('products')

puts "creando productos"
Product.create(
  nombre: "Hamburguesa Sencilla Carne",
  precio: 10000.0,
  descripcion: "Deliciosa hamburguesa con Carne y queso",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Hamburguesa").id
)
Product.create(
  nombre: "Hamburguesa Sencilla Pollo",
  precio: 11000.0,
  descripcion: "Deliciosa hamburguesa con pollo y queso",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Hamburguesa").id
)
Product.create(
  nombre: "Pizza Hawaiana",
  precio: 20000.0,
  descripcion: "Pizza con piña y jamón",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Pizza").id
)
puts "Productos creados #{Product.count}"