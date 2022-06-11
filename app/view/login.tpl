<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="icon" type="image/png" href="./assets/images/pocket.png">
        <link rel="stylesheet" href="./assets/css/login.css">
        <title>Links pockets - New user</title>
    </head>


    <body class="text-center">
        <form class="form-signin" method="post">

            <img class="mb-4" src="assets/images/pocket.png" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Link Pockets</h1>
            <input type="email" name="user[email]" id="inputEmail" class="form-control" value="{{ feedback.email }}" placeholder="Email" required autofocus>

            <input type="password" name="user[pw]" id="inputPassword" class="form-control mt-3" placeholder="Mot de passe" required>

            <button class="btn btn-lg btn-primary btn-block mt-3" type="submit">Connexion</button>
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
