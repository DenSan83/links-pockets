$(() => {
    // Enable popovers
    var pop = [].slice.call($('[data-bs-toggle="popover"]'))
    pop.map(trigger => {
        return new bootstrap.Popover(trigger)
    });

    // Card options
    $('.options, .buttons .close, button.close').on('click', e => {
        e.preventDefault();
        let id = $(e.currentTarget).data('id');
        if ($(id + ' .options-layer').hasClass('show')) {
            $(id + ' .options-layer').removeClass('show');
        } else {
            $('.options-layer').removeClass('show')
            $(id + ' .options-layer').addClass('show');
        }
    });

    // Actions menu
    $('#list').on('click', () => {
        if ($('#new').hasClass('open')) {
            $('#new, #folder').removeClass('open');
        } else {
            $('#new, #folder').addClass('open');
        }
    });

    // Modals
    $('#new').on('click', () => {
        $('#newLink').modal('show');
    });
    $("#newLink").on('shown.bs.modal', function(){
        $(this).find('input:first').focus();
    });

    // New link form validation
    $('#sendNew').on('click', () => {
        let specials=/[*|\":<>[\]{}`\\()'/;%#?&$]/;
        let linkInput = $('#newForm .link');
        let titleInput = $('#newForm .title');
        let feedBack = $('#newForm .title-feedback');
        let linkIsValid = true;
        let titleIsValid = true;
        let error = null;

        // Remove all validators
        $(linkInput).removeClass('is-valid is-invalid');
        $(titleInput).removeClass('is-valid is-invalid');
        $(feedBack).text('');

        // Link is required
        if ($(linkInput).val() === '') {
            linkIsValid = false;
        }
        // Title is required + some characters are forbidden
        if ($(titleInput).val() === '') {
            titleIsValid = false;
            error = 'This field is required';
        } else if (specials.test($(titleInput).val())) {
            titleIsValid = false;
            error = 'Special characters are not allowed in this field';
        }

        if (linkIsValid) {
            $(linkInput).addClass('is-valid');
        } else {
            $(linkInput).addClass('is-invalid');
        }

        if (titleIsValid) {
            $(titleInput).addClass('is-valid');
        } else {
            $(titleInput).addClass('is-invalid');
            $(feedBack).text(error);
        }

        // Send form via Ajax
        if (linkIsValid && titleIsValid) {
            let form = $('#newForm')[0];
            let url = $(form).data('submitto');
            let data = new FormData(form);
            $.post({
                url: url,
                data: data,
                processData: false,
                contentType: false
            })
            .done((response, result) => {
                if (result !== 'success') {
                    // return error;
                    $('#newForm + .form-text')[0].html('An error has occurred. Please try again later.');
                }

                try {
                    response = JSON.parse(response);
                    if (response.success) {
                        location.reload();
                    } else {
                        $('#newForm + .form-text')[0].html(response.errors);
                    }
                } catch (e) {
                    $('#newForm + .form-text').html('An error has occurred. Please try again later.');
                }
            })
        }


    })
});