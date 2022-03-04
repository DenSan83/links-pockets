$(() => {
    $('.options, .buttons .close, button.close').on('click', e => {
        e.preventDefault();
        let id = $(e.currentTarget).data('id');console.log(id)
        if ($(id).hasClass('show')) {
            $(id).removeClass('show');
        } else {
            $('.options-layer').removeClass('show')
            $(id).addClass('show');
        }
    })

});