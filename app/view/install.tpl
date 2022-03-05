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
            <h1 class="text-center">Install</h1>
            <div>
                <p>Welcome to my Links pockets app.</p>
                <p>Let's get you started:</p>
                <p>(We need a MySql Database)</p>
            </div>
            {% if pdo is null %}
                <form method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="pdo[host]" placeholder="Your DB host" required>
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
                        <button class="btn btn-outline-primary" type="submit">Submit</button>
                    </div>
                </form>
            {% else %}
                <h3>PDO infos</h3>
                <div>
                    <form method="post">
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

                        <input class="btn btn-outline-primary" type="submit" name="confirm[no]" value="Return">
                        <input class="btn btn-outline-primary" type="submit" name="confirm[yes]" value="Continue">
                    </form>
                </div>
            {% endif %}
        </div>
    </body>
</html>
