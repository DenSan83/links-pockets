<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="./assets/css/login.css">
        <title>Links pockets</title>
    </head>

    <body class="text-center">
        <form class="form-signin install" method="post">

            <img class="mb-4" src="assets/images/pocket.png" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Link Pockets</h1>
            {% if pdo is null %}
                <h4>Install</h4>
                <div>
                    <p>Welcome to my Links pockets app.<br>
                    We need a MySql Database. <br>
                    Let's get you started:</p>
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" name="pdo[host]" placeholder="Your DB host" required autofocus>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" name="pdo[name]" placeholder="Your DB name" required>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" name="pdo[user]" placeholder="Your DB user" required>
                </div>
                <div class="mb-3">
                    <input type="text" class="form-control" name="pdo[pass]" placeholder="Your DB password">
                </div>
                <div class="mb-3">
                    <button class="btn btn-outline-primary" type="submit">Connect</button>
                </div>
            {% else %}
                <h4>PDO infos</h4>
                <div>
                    <p><b>Host: </b> {{ pdo.host }}</p>
                    <input type="hidden" name="confirm[host]" value="{{ pdo.host }}" autofocus>
                    <p><b>Name: </b> {{ pdo.name }}</p>
                    <input type="hidden" name="confirm[name]" value="{{ pdo.name }}">
                    <p><b>User: </b> {{ pdo.user }}</p>
                    <input type="hidden" name="confirm[user]" value="{{ pdo.user }}">
                    <p><b>Password: </b> {{ pdo.pass ? pdo.pass : '(empty)' }}</p>
                    <input type="hidden" name="confirm[pass]" value="{{ pdo.pass }}">
                    <p>
                        Are you sure you wish to proceed with this infos?
                    </p>

                    <input class="btn btn-secondary" type="submit" name="confirm[no]" value="Return">
                    <input class="btn btn-danger" type="submit" name="confirm[yes]" value="Continue">
                </div>
            {% endif %}

            <br>
            {% if error %}
                <div class="alert alert-danger mt-3" role="alert">
                    {{ error }}
                </div>
            {% endif %}
            <p class="mt-5 mb-3 text-muted">desan.fr - &copy; 2022</p>
        </form>
    </body>
</html>
