<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="{{ HOST }}/assets/images/pocket.png">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="{{ HOST }}/assets/css/style.css">
        <title>Links pockets</title>
    </head>
    <body>
        <div class="container position-relative">
            {% if session.notification %}
                <div class="alert alert-{{ session.notification.type }} position-absolute notification" role="alert">
                    {{ session.notification.msg|raw }}
                </div>
            {% endif %}
            <div class="float-end">

                <div class="dropdown mt-2">
                    <button class="btn btn-secondary d-flex py-2 px-3" type="button" id="optionsMenu" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        {{ 'gear'|icon }}
                    </button>
                    {% include 'composants/sidebar.tpl' %}
                </div>
            </div>
            <h1>Links pockets</h1>
            <a id="home" href="{{ HOST }}"></a>
            <div class="header">
                <div class="float-end">
                    <a href="#searchbar" class="btn btn-outline-secondary" data-bs-target="#searchbar" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="searchbar">
                        {{ 'search'|icon }}
                    </a>
                </div>

                {% include 'breadcrumb.tpl' %}

                <div class="collapse" id="searchbar">
                    <form class="mt-2" action="{{ HOST }}/search">
                        <input type="text" class="form-control" name="keyword" value="{{ keyword }}" placeholder="Your search" >
                    </form>
                </div>

            </div>

            {% block body %}{% endblock %}
        </div>

        {% include 'modals.tpl' %}




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="{{ HOST }}/assets/js/Validator.js"></script>
        <script src="{{ HOST }}/assets/js/script.js"></script>
    </body>
</html>