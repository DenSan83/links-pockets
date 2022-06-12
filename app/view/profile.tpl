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
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-gear" viewBox="0 0 16 16">
                            <path d="M8 4.754a3.246 3.246 0 1 0 0 6.492 3.246 3.246 0 0 0 0-6.492zM5.754 8a2.246 2.246 0 1 1 4.492 0 2.246 2.246 0 0 1-4.492 0z"/>
                            <path d="M9.796 1.343c-.527-1.79-3.065-1.79-3.592 0l-.094.319a.873.873 0 0 1-1.255.52l-.292-.16c-1.64-.892-3.433.902-2.54 2.541l.159.292a.873.873 0 0 1-.52 1.255l-.319.094c-1.79.527-1.79 3.065 0 3.592l.319.094a.873.873 0 0 1 .52 1.255l-.16.292c-.892 1.64.901 3.434 2.541 2.54l.292-.159a.873.873 0 0 1 1.255.52l.094.319c.527 1.79 3.065 1.79 3.592 0l.094-.319a.873.873 0 0 1 1.255-.52l.292.16c1.64.893 3.434-.902 2.54-2.541l-.159-.292a.873.873 0 0 1 .52-1.255l.319-.094c1.79-.527 1.79-3.065 0-3.592l-.319-.094a.873.873 0 0 1-.52-1.255l.16-.292c.893-1.64-.902-3.433-2.541-2.54l-.292.159a.873.873 0 0 1-1.255-.52l-.094-.319zm-2.633.283c.246-.835 1.428-.835 1.674 0l.094.319a1.873 1.873 0 0 0 2.693 1.115l.291-.16c.764-.415 1.6.42 1.184 1.185l-.159.292a1.873 1.873 0 0 0 1.116 2.692l.318.094c.835.246.835 1.428 0 1.674l-.319.094a1.873 1.873 0 0 0-1.115 2.693l.16.291c.415.764-.42 1.6-1.185 1.184l-.291-.159a1.873 1.873 0 0 0-2.693 1.116l-.094.318c-.246.835-1.428.835-1.674 0l-.094-.319a1.873 1.873 0 0 0-2.692-1.115l-.292.16c-.764.415-1.6-.42-1.184-1.185l.159-.291A1.873 1.873 0 0 0 1.945 8.93l-.319-.094c-.835-.246-.835-1.428 0-1.674l.319-.094A1.873 1.873 0 0 0 3.06 4.377l-.16-.292c-.415-.764.42-1.6 1.185-1.184l.292.159a1.873 1.873 0 0 0 2.692-1.115l.094-.319z"/>
                        </svg>
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
                                <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                </svg>
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
                                        <svg xmlns="http://www.w3.org/2000/svg" width="200" height="200" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                                            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                                        </svg>
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
