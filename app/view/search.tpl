{% extends 'layout.tpl' %}

{% block body %}
    <div id="main d-block">
        <div class="col">
            Word:
            {% if keyword is empty %}
                <span class="text-danger">(empty)</span>
            {% else %}
                <span class="text-success">{{ keyword }}</span>
            {% endif %}
            <br>
            {% if content|length == 1 %}
                1 result found
            {% elseif content|length != 0 %}
                {{ content|length }} results found
            {% endif %}
        </div>
        {% for link in content %}
            <div class="d-flex mt-4">
                <div class="mb-0 col-sm-5 offset-md-1 offset-lg-2 breadcrumb">

                    {% set linkOrg = link.org|split('/') %}
                    {% for count, level in linkOrg %}
                        {% set route = route ~ '/' ~ level  %}
                        {% if level is same as('*')%} {# first(home) #}
                            <li class="breadcrumb-item">
                                <a href="{{ HOST }}/folder/*" class="btn btn-outline-primary">
                                    <img src="{{ HOST }}/assets/images/pocket.png" alt="Pocket icon" height="18">
                                </a>
                            </li>
                        {% elseif level is not same as('#') %}
                            <li class="breadcrumb-item">
                                <a href="{{ HOST }}/folder{{ route }}">{{ level }}</a>
                            </li>
                        {% endif %}
                    {% endfor %}

                </div>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    {% include 'link.tpl' %}
                </div>
            </div>
        {% else %}
            No results found
        {% endfor %}
    </div>

    {% include 'composants/controls.tpl' %}
{% endblock %}