$(() => {
    // Enable popovers
    var pop = [].slice.call($('[data-bs-toggle="popover"]'))
    pop.map(trigger => {
        return new bootstrap.Popover(trigger)
    });
    // Hide notifications
    if ($('.alert.notification').length > 0) {
        const alert = bootstrap.Alert.getOrCreateInstance('.alert.notification');
        setTimeout(function() {
            alert.close()
        }, 3000);
    }

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
    $('#folder').on('click', () => {
        $('#newFolder').modal('show');
    });
    $('#newLink').on('shown.bs.modal', function(){
        $(this).find('input:first').trigger('focus');
    });
    
    // Modify
    $('.edit').on('click', e => {
        let id = $(e.currentTarget).parents('.options-layer').data('id');
        let url = $('#home').attr('href') + '/find-id';
        $.post( url, { id: id })
        .done((response) => {
            response = JSON.parse(response);
            if (response.success) {
                $('#editLink').modal('show');
                
                $('#editForm input[name="editLink[url]"]').val(response.data.url);
                $('#editForm input[name="editLink[title]"]').val(response.data.title);
                $('#editForm input[name="editLink[description]"]').val(response.data.description);
                $('#editForm input[name="editLink[img]"]').val(response.data.img);
                $('#editForm input[name="editLink[id]"]').val(response.data.id);
                $('#editForm input[name="editLink[org]"]').val(response.data.org);
            } else {
                // display errors
            }
        })
    })
    $('.edit-folder').on('click', e => {
        let id = $(e.currentTarget).parents('.options-layer').data('id');
        let url = $('#home').attr('href') + '/find-id';
        $.post( url, { id: id })
        .done((response) => {
            response = JSON.parse(response);
            if (response.success) {
                $('#editFolder').modal('show');

                $('#editFolderForm input[name="editFolder[url]"]').val(response.data.url);
                $('#editFolderForm input[name="editFolder[title]"]').val(response.data.title);
                $('#editFolderForm input[name="editFolder[description]"]').val(response.data.description);
                $('#editFolderForm input[name="editFolder[id]"]').val(response.data.id);
                $('#editFolderForm input[name="editFolder[org]"]').val(response.data.org);
            } else {
                // display errors
            }
        })
    })

    // Form validation
    let validator = new Validator();
    $('#sendNew').on('click', () => {
        validator.validateLink('#newForm');
    })
    $('#sendNewFolder').on('click', () => {
        validator.validateFolder('#newFolderForm');
    })

    $('#sendEdit').on('click', () => {
        validator.validateLink('#editForm');
    })
    $('#sendEditFolder').on('click', () => {
        validator.validateFolder('#editFolderForm');
    })

    $('.delete').on('click', e => {
        let id = $(e.currentTarget).parents('.options-layer').data('id');
        let url = $('#home').attr('href') + '/find-id';

        $.post( url, { id: id })
            .done((response) => {
                response = JSON.parse(response);
                if (response.success) {
                    $('#deleteModal').modal('show');

                    $('#deleteForm input[name="delete[title]"]').val(response.data.title);
                    $('#deleteForm input[name="delete[description]"]').val(response.data.description);
                    $('#deleteForm input[name="delete[id]"]').val(response.data.id);
                    $('#deleteForm input[name="delete[org]"]').val(response.data.org);
                } else {
                    // display errors
                }
            })
    })

    $('#sendDelete').on('click', () => {
        let form = $('#deleteForm');
        let url = $(form).data('submitto');
        let values = $(form).serialize();

        $.post( url, values)
            .done(response => {
                response = JSON.parse(response);
                if (response.deleted) {
                    location.reload();
                }
            })

    })




});