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
    $('#folder').on('click', () => {
        $('#newFolder').modal('show');
    });
    $("#newLink").on('shown.bs.modal', function(){
        $(this).find('input:first').focus();
    });
    
    // Modify
    $('.edit').on('click', e => {
        let id = $(e.currentTarget).parents('.options-layer').data('id');
        let url = $('#home').attr('href') + '/find-id';
        $.post( url, { id: id })
        .done((response, result) => {
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

    // Form validation
    let validator = new Validator();
    $('#sendNew').on('click', () => {
        validator.validateLink('#newForm');
    })
    $('#sendNewFolder').on('click', () => {
        validator.validateNewFolder();
    })

    $('#sendEdit').on('click', () => {
        validator.validateLink('#editForm');
    })
    $('#sendNewFolder').on('click', () => {
        validator.validateNewFolder();
    })






});