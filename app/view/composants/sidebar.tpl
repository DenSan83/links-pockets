<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
    <div class="d-flex h-100 flex-column flex-shrink-0 p-3 bg-light">
        <div class="text-end">
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        {# Side Navbar #}
        <ul class="nav nav-pills flex-column mt-5 mb-auto">
            <li class="rounded">
                <a href="{{ HOST }}" class="nav-link link-dark">
                    <img src="{{ HOST }}/assets/images/pocket.png" alt="Pocket icon" height="16" class="me-2">
                    Home
                </a>
            </li>
        </ul>
        <hr>

        {# Account management #}
        <div class="dropdown">
            <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                {% if session.user_data.avatar %}
                    <img src="{{ HOST }}/assets/images/uploads/{{ session.user_data.id }}/{{ session.user_data.avatar }}" width="32" height="32" class="rounded-circle me-2 user-avatar">
                {% else %}
                    <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                    </svg>
                {% endif %}
                <strong>{{ session.user_data.name|capitalize }}</strong>
            </a>
            <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">
                <li><a class="dropdown-item" href="{{ HOST }}/profile">Profile</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item text-danger" href="{{ HOST }}/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</div>