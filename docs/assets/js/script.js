function toggleMenu() {
    const aside = document.querySelectorAll('#aside-1')
    aside.forEach(link => {
        link.classList.add('show');
    });
}

function closeMenu(){
    const aside = document.querySelectorAll('#aside-1')
    aside.forEach(link => {
        link.classList.remove('show');
    })
}

document.addEventListener('DOMContentLoaded', () => {
    const section = document.getElementById('section-1');
    const links = document.querySelectorAll('.nav-link');
    const aside = document.getElementById("aside-1")

    function loadView(viewName){
        fetch(`views/${viewName}.html`)
            .then(res => res.text())
            .then(html => section.innerHTML = html)
            .catch(err => {
                section.innerHTML = '<p>Error al cargar la vista</p><br>';
                console.error('Error al cargar la vista:', err);
            });
    }

    function syncActive(linkClicked) {
        const view = linkClicked.getAttribute('data-section');

        links.forEach(l => {
            if(l.getAttribute('data-section') == view) {
                l.classList.add('active');
            }else{
                l.classList.remove('active');
            }
        });
    }


    links.forEach(link => {
        link.addEventListener('click', e => {
            e.preventDefault();

            const view = link.getAttribute('data-section');
            loadView(view);
            syncActive(link);

            aside.classList.remove('show');
        });
    });

    loadView('home');
    links.forEach(link => {
        if (link.getAttribute('data-section') === 'home') {
            link.classList.add('active');
        }
    })
});
