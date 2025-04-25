document.addEventListener('DOMContentLoaded', () => {
    const section = document.getElementById('section1');
    const links = document.querySelectorAll('#nav-link');

    function loadView(viewName){
        fetch(`views/${viewName}.html`)
            .then(res => res.text())
            .then(html => section.innerHTML = html)
            .catch(err => {
                section.innerHTML = '<p>Error al cargar la vista</p><br>';
                console.error('Error al cargar la vista:', err);
            });
    }

    links.forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault();
            const views = link.getAttribute('data-section');
            loadView(views);
            links.forEach(l => l.classList.remove('active'));
            link.classList.add('active');
        });
    });

    loadView('home');
    links[0].classList.add('active');
});
