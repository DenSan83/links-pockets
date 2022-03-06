$(() => {
    // Enable popovers
    var pop = [].slice.call($('[data-bs-toggle="popover"]'))
    pop.map(trigger => {
        return new bootstrap.Popover(trigger)
    })

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
    })

    // Actions menu
    $('#list').on('click', () => {
        if ($('#new').hasClass('open')) {
            $('#new, #folder').removeClass('open');
        } else {
            $('#new, #folder').addClass('open');
        }
    })
});