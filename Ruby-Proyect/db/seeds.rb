Grupo.destroy_all
User.destroy_all
Product.destroy_all


ActiveRecord::Base.connection.reset_pk_sequence!('grupos')

puts "creando grupos"
Grupo.create(nombre: "Grupo 1")
Grupo.create(nombre: "Grupo 2")
Grupo.create(nombre: "Grupo 3")
puts "Grupos creados #{Grupo.count}"

ActiveRecord::Base.connection.reset_pk_sequence!('users')

puts "creando usuarios"
User.create(
  email: "admin@admin",
  password: "rasdix-jePjor-kohsy6",
  nombre: "Admin",
  apellido: "Admin",
  telefono: "123456789",
  rol: :admin,
  confirmed_at: Time.current # Encargado de que si el correo esta verificado lo puede dejar entrar
)

puts "Usuarios creados #{User.count}"


ActiveRecord::Base.connection.reset_pk_sequence!('products')

puts "creando productos"
Product.create(
  nombre: "Producto 1",
  precio: 9900.0,
  descripcion: "Descripción del producto 1",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 1").id
)
Product.create(
  nombre: "Producto 2",
  precio: 99900.0,
  descripcion: "Descripción del producto 2",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 1").id
)
Product.create(
  nombre: "Producto 3",
  precio: 900.0,
  descripcion: "Descripción del producto 3",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 1").id
)
Product.create(
  nombre: "Producto 4",
  precio: 9999.0,
  descripcion: "Descripción del producto 4",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 1").id
)
Product.create(
  nombre: "Producto 5",
  precio: 9999.0,
  descripcion: "Descripción del producto 5",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 1").id
)


Product.create(
  nombre: "Producto 1",
  precio: 9900.0,
  descripcion: "Descripción del producto 1",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 2").id
)
Product.create(
  nombre: "Producto 2",
  precio: 99900.0,
  descripcion: "Descripción del producto 2",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 2").id
)
Product.create(
  nombre: "Producto 3",
  precio: 900.0,
  descripcion: "Descripción del producto 3",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 2").id
)
Product.create(
  nombre: "Producto 4",
  precio: 9999.0,
  descripcion: "Descripción del producto 4",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 2").id
)
Product.create(
  nombre: "Producto 5",
  precio: 9999.0,
  descripcion: "Descripción del producto 5",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 2").id
)


Product.create(
  nombre: "Producto 1",
  precio: 9900.0,
  descripcion: "Descripción del producto 1",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 3").id
)
Product.create(
  nombre: "Producto 2",
  precio: 99900.0,
  descripcion: "Descripción del producto 2",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 3").id
)
Product.create(
  nombre: "Producto 3",
  precio: 900.0,
  descripcion: "Descripción del producto 3",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 3").id
)
Product.create(
  nombre: "Producto 4",
  precio: 9999.0,
  descripcion: "Descripción del producto 4",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 3").id
)
Product.create(
  nombre: "Producto 5",
  precio: 9999.0,
  descripcion: "Descripción del producto 5",
  disponible: true,
  grupo_id: Grupo.find_by(nombre: "Grupo 3").id
)

puts "Productos creados #{Product.count}"
