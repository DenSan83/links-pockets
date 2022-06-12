<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="{{ HOST }}/assets/images/pocket.png">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <link rel="stylesheet" href="./assets/css/style.css">
        <title>Links pockets - New user</title>
    </head>
    <body>
        <div class="container">
            {% if session.notification %}
                <div class="alert alert-{{ session.notification.type }} position-absolute notification" role="alert">
                    {{ session.notification.msg|raw }}
                </div>
            {% endif %}

            {% if session.user_data %}
                <div class="dropdown mt-2 float-end">
                    <button class="btn btn-secondary d-flex py-2 px-3" type="button" id="optionsMenu" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                        {{ 'gear'|icon }}
                    </button>
                    {% include 'composants/sidebar.tpl' %}
                </div>
            {% endif %}

            {% if session.user_data %}
                <h1 class="text-center mt-5">User profile</h1>
            {% else %}
                <h1 class="text-center mt-5">Create new user</h1>
            {% endif %}
            {% if user_count is same as(0) %}
                <div class="alert alert-primary" role="alert">
                    The first user will become the admin of this app. <br>
                    Let's create our first user :
                </div>
            {% endif %}

            <form class="form-signin rounded p-1 pb-3 mb-5" id="userForm" method="post">
                <div class="row">
                    <div class="col-lg-3 text-center pe-4 pt-3">
                        <div class="position-relative">
                            {% if session.user_data %}
                                <a href="#uploadModal" class="top-screen text-light btn position-absolute rounded-circle d-flex align-items-center justify-content-center" data-bs-toggle="modal" data-bs-target="#uploadModal">
                                    changer
                                </a>
                            {% endif %}
                            {% if session.user_data.avatar %}
                                <img class="mb-4 rounded-circle user-avatar" src="{{ HOST }}/assets/images/uploads/{{ session.user_data.id }}/{{ session.user_data.avatar }}" width="100" height="100">
                            {% else %}
                                {{ 'personcircle'|icon(100) }}
                            {% endif %}
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <h1 class="h3 mb-3 font-weight-normal">{{ user.mail }}</h1>

                        <div class="mb-3">
                            <label for="inputName" class="form-label">User name</label>
                            <input type="text" name="user[name]" id="inputName" class="form-control" value="{{ session.user_data.name }}" placeholder="The way we will call you" required autofocus>
                        </div>
                        <div class="mb-3">
                            <label for="inputEmail" class="form-label">Email</label>
                            <input type="email" name="user[email]" id="inputEmail" class="form-control" value="{{ session.user_data.email }}" placeholder="Your email will help you connect to this app" required>
                        </div>
                        <div class="mb-3">
                            <label for="inputPass1" class="form-label">Password</label>
                            <input type="password" name="user[pw]" id="inputPass1" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="inputPass2" class="form-label">Repeat password</label>
                            <input type="password" name="user[pw2]" id="inputPass2" class="form-control">
                        </div>
                        {% if session.user_data %}
                            <input type="hidden" name="user[id]" value="{{ session.user_data.id }}">
                        {% endif %}

                        {% if errors %}
                            {% for error in errors %}
                                <small class="form-text text-muted">
                                    <span class="text-danger">{{ error }}</span>
                                </small>
                                <br>
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
                    {% if session.user_data %}
                        <a href="{{ HOST }}/folder/{{ session.breadcrumb|join('/') }}" class="btn btn-lg btn-secondary btn-block mt-3 me-3" type="button">Back</a>
                    {% endif %}
                    <button class="btn btn-lg btn-primary btn-block mt-3 me-3" type="submit">Save</button>
                </div>

            </form>

            {# upload image modal #}
            <div class="modal fade" id="uploadModal" tabindex="-1" aria-labelledby="uploadModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="uploadModalLabel">Upload image</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="post" enctype="multipart/form-data">
                            <div class="modal-body">
                                <div class="w-100 text-center">
                                    {% if session.user_data.avatar %}
                                        <img src="{{ HOST }}/assets/images/uploads/{{ session.user_data.id }}/{{ session.user_data.avatar }}" width="200" height="200" class="rounded-circle me-2 user-avatar">
                                    {% else %}
                                        {{ 'personcircle'|icon(200) }}
                                    {% endif %}
                                </div>
                                <div class="input-group d-block">
                                    <label for="uploadFile" class="form-label">Please upload an image in format *.jpg, *jpeg or *.gif</label><br>
                                    <input type="file" id="uploadFile" class="form-control w-100 rounded" name="photo-upload" aria-label="Upload">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Upload</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script src="{{ HOST }}/assets/js/script.js"></script>
    </body>
</html>
