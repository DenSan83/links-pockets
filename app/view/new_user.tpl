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
            <h1 class="text-center mt-5">Create new user</h1>
            {% if user_count == 0 %}
                <p>The first user will become the admin of this app. <br>
                    Let's create our first user :</p>
            {% endif %}

            <form class="form-signin rounded p-1 pb-3" id="userForm" method="post">
                <div class="row">
                    <div class="col-lg-3 text-center pe-4 pt-3">
                        {% if user.img %}
                            <img class="mb-4" src="imgs/{{ user.shortname }}.jpg" width="100" height="100">
                        {% else %}
                            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                            </svg>
                        {% endif %}
                    </div>

                    <div class="col-lg-6">
                        <h1 class="h3 mb-3 font-weight-normal">{{ user.mail }}</h1>

                        <div class="mb-3">
                            <label for="inputName" class="form-label">User name</label>
                            <input type="text" name="user[name]" id="inputName" class="form-control" value="{{ user.name }}" placeholder="The way we will call you" required autofocus>
                        </div>
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" name="user[email]" id="inputEmail" class="form-control" value="{{ user.email }}" placeholder="Your email will help you connect to this app" required>
                        </div>
                        <div class="mb-3">
                            <label for="inputPass1" class="form-label">Password</label>
                            <input type="password" name="user[pw]" id="inputPass1" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="inputPass2" class="form-label">Repeat password</label>
                            <input type="password" name="user[pw2]" id="inputPass2" class="form-control">
                        </div>

                        {% if errors %}
                            {% for error in errors %}
                                <small class="form-text text-muted"><span class="text-danger">{{ error }}</span></small><br>
                            {% endfor %}
                        {% endif %}
                        <small class="form-text text-muted">
                            Your password must have :
                            <ul class="pw-help">
                                <li {% if pwCheck.update and not pwCheck.length %} class="text-danger" {% endif %} >At least 8 characters</li>
                                <li {% if pwCheck.update and not pwCheck.upper %} class="text-danger" {% endif %} >At least one upper character</li>
                                <li {% if pwCheck.update and not pwCheck.lower %} class="text-danger" {% endif %} >At least one lower character</li>
                                <li {% if pwCheck.update and not pwCheck.number %} class="text-danger" {% endif %} >At least one number</li>
                            </ul>
                        </small>

                    </div>
                </div>
                {% if pwCheck.success %}
                    <div class="alert alert-success mt-3" role="alert">
                        Your password has been updated
                    </div>
                {% endif %}



                <div class="d-flex justify-content-end">
                    {% if user %}
                        <a href="{{ HOST }}" class="btn btn-lg btn-secondary btn-block mt-3 me-3" type="button">Back</a>
                    {% endif %}
                    <button class="btn btn-lg btn-primary btn-block mt-3 me-3" type="submit">Save</button>
                </div>

            </form>

        </div>
    </body>
</html>
