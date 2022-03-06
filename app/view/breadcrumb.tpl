<ol class="breadcrumb mb-1">
    {% for count, level in session.breadcrumb %}
        {% set route = route ~ '/' ~ level  %}
        {% if level is same as('*')%} {# first(home) #}
            <li class="breadcrumb-item">
                <a href="{{ HOST }}/folder/*" class="btn btn-outline-primary">
                    <img src="{{ HOST }}/assets/images/pocket.png" alt="Pocket icon" height="18">
                </a>
            </li>
        {% elseif count == session.breadcrumb|length %} {# last #}
            <li class="breadcrumb-item active" aria-current="page">
                {{ level }}
            </li>
        {% else %} {# every other link on breadcrumb #}
            <li class="breadcrumb-item">
                <a href="{{ HOST }}/folder{{ route }}">{{ level }}</a>
            </li>
        {% endif %}
    {% endfor %}
</ol>