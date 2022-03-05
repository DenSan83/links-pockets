<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="./assets/css/style.css">
    <title>Links pockets - New user</title>
</head>
<body>
<div class="container">
    <h1 class="text-center">Login</h1>
    <div>
        <p>Please login</p>
    </div>
    <form method="post">
        <div class="mb-3">
            <input type="text" class="form-control" name="user[name]" value="{{ user.name }}" placeholder="Username" required autofocus>
        </div>
        <div class="mb-3">
            <input type="password" class="form-control" name="user[pw]" value="{{ user.pw }}" placeholder="Password" required>
        </div>
        <div class="mb-3">
            <button class="btn btn-outline-primary" type="submit">Submit</button>
        </div>
    </form>
    {% if error %}
        <p class="text-danger">{{ error }}</p>
    {% endif %}
</div>
</body>
</html>
