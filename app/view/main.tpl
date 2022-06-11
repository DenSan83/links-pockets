{% extends 'layout.tpl' %}

{% block body %}
    <div id="main">
        {% for link in content %}
            {% include 'link.tpl' %}
        {% endfor %}
    </div>

    {% include 'composants/controls.tpl' %}
{% endblock %}