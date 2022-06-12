<div class="pocket card col-auto m-2">
    <div id="pocket_{{ link.id }}" class="options-container w-100">
        {% if link.org|last == '#' %} {# This is a folder behavior #}
            <a href="{{ HOST ~ '/' ~ link.url }}" class="d-block">
                <img src="{{ HOST ~ '/' ~ link.img }}" class="card-img-top folder" alt="{{ link.title }}">
            </a>
        {% else %} {# This is a link behavior #}
            <a href="{{ link.url }}" class="d-block" target="_blank">
                <img src="{{ link.img }}" class="card-img-top" alt="{{ link.title }}">
            </a>
        {% endif %}
        <div class="options-layer" data-id="{{ link.id }}">

            {# Buttons responsive #}
            <div class="d-sm-none h-100">
                <div class="d-flex justify-content-around w-100 h-50">
                    <button class="see-comment btn btn-outline-secondary bg-light m-auto">{{ 'infocircle'|icon }}</button>
                    <button class="close btn btn-outline-secondary bg-light m-auto" data-id="#pocket_{{ link.id }}">{{ 'x'|icon }}</button>
                </div>
                <div class="d-flex justify-content-around w-100 h-50">
                    {% if link.org|last == '#' %} {# This triggers a folder editor #}
                        <button class="edit-folder btn btn-outline-secondary bg-light m-auto">{{ 'pencilsquare'|icon }}</button>
                    {% else %}  {# This triggers a link editor #}
                        <button class="edit btn btn-outline-secondary bg-light m-auto">{{ 'pencilsquare'|icon }}</button>
                    {% endif %}
                    <button class="delete btn btn-outline-secondary bg-light m-auto">{{ 'trash3'|icon }}</button>
                </div>
            </div>
            {# Buttons desktop #}
            <div class="d-none d-sm-flex text-light h-100 justify-content-between">
                <div class="description p-2">{{ link.description }}</div>
                <div class="buttons d-flex flex-column">
                    <span class="close p-2" data-id="#pocket_{{ link.id }}">X</span>
                    {% if link.org|last == '#' %} {# This triggers a folder editor #}
                        <span class="edit-folder p-2">{{ 'pencilsquare'|icon }}</span>
                    {% else %}
                        <span class="edit p-2">{{ 'pencilsquare'|icon }}</span>
                    {% endif %}
                    <span class="delete p-2">{{ 'trash3'|icon }}</span>
                </div>
            </div>
        </div>

    </div>
    <a href="" class="options text-dark"  data-id="#pocket_{{ link.id }}">
        <div class="card-body d-flex py-1 px-4">
            <h6 class="h6 text-center mt-1 w-100" title="Card title">{{ link.title }}</h6>
            <span class="d-lg-none text-secondary">{{ 'caretupsquarefill'|icon }}</span>
        </div>
    </a>
</div>