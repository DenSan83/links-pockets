<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Links pockets</title>
    </head>
    <body>
        <div class="container">
            <h1>Links pockets</h1>
            <div class="header">
                <div class="float-end">
                    <a href="#searchbar" class="btn btn-outline-secondary" data-bs-target="#searchbar" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="searchbar">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </a>
                </div>

                <nav class="nav" style="" aria-label="breadcrumb">
                    <ol class="breadcrumb mb-1">
                        <li class="breadcrumb-item">
                            <a href="" class="btn btn-outline-primary">
                                <img src="./assets/images/pocket.png" alt="Pocket icon" height="18">
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">Categorie1</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">Categorie2</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            Library
                        </li>
                    </ol>
                </nav>

                <div class="collapse" id="searchbar">
                    <form class="mt-2">
                        <input type="text" class="form-control" placeholder="Your search">
                    </form>
                </div>

            </div>

            <div id="main">

                {% for i in 1..8 %}
                    {% include 'link.tpl' %}
                {% endfor %}
            </div>
        </div>




        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="./assets/js/script.js"></script>
        {#        <a href="https://www.flaticon.com/free-icons/pocket" title="pocket icons">Pocket icons created by Freepik - Flaticon</a>#}
    </body>
</html>