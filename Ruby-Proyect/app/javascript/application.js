// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.boton-pedir-ahora').forEach(boton =>{
        boton.addEventListener('click', () =>{
            const productoId = boton.dataset.productoId;
            document.getElementById('producto_id').value = productoId;
            
            const form = document.getElementById('formulario-pedido');
            form.style.display = 'block';
            form.scrollIntoView({behavior: 'smooth'});
        });
    });
});
